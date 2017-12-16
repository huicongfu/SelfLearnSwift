//
//  NighthWeekOneVC.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/12/12.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit
import AVFoundation

class NighthWeekOneVC: UIViewController,AVCaptureVideoDataOutputSampleBufferDelegate {
    
    var captureSession = AVCaptureSession.init()
    var previewLayer:AVCaptureVideoPreviewLayer?
    
    let recognitionModel = Inceptionv3.init()
    
    let resultInfoLabel = UILabel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createUI()
    }
    
    func createUI() {
        //创建捕捉会话
        captureSession = AVCaptureSession.init()
        captureSession.sessionPreset = AVCaptureSessionPresetInputPriority
        guard let captureDevice = configureDevice() else { return }
        guard let input = try? AVCaptureDeviceInput.init(device: captureDevice) else {
            fatalError("Can't init captureDeviceInput")
        }
        captureSession.addInput(input)
        
        let outPut = AVCaptureVideoDataOutput.init()
        let queue = DispatchQueue.init(label: "fhc")
        outPut.setSampleBufferDelegate(self, queue: queue)
        outPut.videoSettings = [kCVPixelBufferPixelFormatTypeKey as AnyHashable as! String:NSNumber.init(value: kCVPixelFormatType_32BGRA)]
        outPut.alwaysDiscardsLateVideoFrames = true
        guard captureSession.canAddOutput(outPut) else {
            fatalError()
        }
        captureSession.addOutput(outPut)
        startCapturingWithSession(captureSession: captureSession)
        
        setUpResultInfoView()
    }
    
    func configureDevice() -> AVCaptureDevice? {
        guard let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo) else {
            return nil
        }
        
        //是否可选前后摄像头?
        var customFormats = [AVCaptureDevice.Format].init()
        let customFPS = Float64(3)
        for format in device.formats {
            for range in (format as! AVCaptureDevice.Format).videoSupportedFrameRateRanges where (range as AnyObject).minFrameRate <= customFPS && customFPS <= (range as AnyObject).maxFrameRate {
                customFormats.append(format as! AVCaptureDevice.Format)
            }
        }
        
        let customSize = CGSize.init(width: 227, height: 227)
        
        var sizeFormat:AVCaptureDevice.Format?
        for format in customFormats {
            let desc = format.formatDescription
            let dimensions = CMVideoFormatDescriptionGetDimensions(desc!)
            if dimensions.width >= Int32.init(customSize.width) && dimensions.height >= Int32.init(customSize.height) {
                sizeFormat = format
            }
        }
        
        do {
            try device.lockForConfiguration()
        } catch {
            fatalError("error when request configuration")
        }
        
        device.activeFormat = sizeFormat
        device.activeVideoMaxFrameDuration = CMTimeMake(1, Int32.init(customFPS))
        device.activeVideoMinFrameDuration = CMTimeMake(1, Int32.init(customFPS))
        device.focusMode = .continuousAutoFocus
        device.unlockForConfiguration()
        
        return device
    }
    
    //MARK: AVCaptureVideoDataOutputSampleBufferDelegate
    func captureOutput(_ output: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, from connection: AVCaptureConnection!) {
        handleImageBufferWithCoreML(imageBuffer: sampleBuffer)
    }
    
    // MARK: CoreML识别图片的方法
    func handleImageBufferWithCoreML(imageBuffer:CMSampleBuffer) {
        guard let buffer = CMSampleBufferGetImageBuffer(imageBuffer) else {
            print("could not get a pixel buffer")
            return
        }
        
        let capturedImage:UIImage
        do {
            CVPixelBufferLockBaseAddress(buffer, CVPixelBufferLockFlags.readOnly)
            defer {
                CVPixelBufferUnlockBaseAddress(buffer, CVPixelBufferLockFlags.readOnly)
            }
            
            let address = CVPixelBufferGetBaseAddressOfPlane(buffer, 0)
            let bytes = CVPixelBufferGetBytesPerRow(buffer)
            let width = CVPixelBufferGetWidth(buffer)
            let height = CVPixelBufferGetHeight(buffer)
            let color = CGColorSpaceCreateDeviceRGB()
            let bits = 8
            let info = CGBitmapInfo.byteOrder32Little.rawValue | CGImageAlphaInfo.premultipliedFirst.rawValue
            guard let context = CGContext.init(data: address, width: width, height: height, bitsPerComponent: bits, bytesPerRow: bytes, space: color, bitmapInfo: info) else {
                
                print("could not create an CGContext")
                return
            }
            
            guard let image = context.makeImage() else {
                print("could not create an CGImage")
                return
            }
            
            capturedImage = UIImage.init(cgImage: image, scale: 1.0, orientation: UIImageOrientation.up)
            
            let size = CGSize.init(width: 299, height: 299)
            UIGraphicsBeginImageContext(size)
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            let cvPixelBuffer = UiImageToCVPixelBuffer(from: scaledImage!)
            
            do {
                let prediction = try self.recognitionModel.prediction(image: cvPixelBuffer!)
                DispatchQueue.main.async {
                    var name:String = ""
                    var confidence:Double = 0
                    for index in prediction.classLabelProbs {
                        if confidence < index.value {
                            confidence = index.value
                            name = index.key
                        }
                    }
                    
                    let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: self.resultInfoLabel.frame.width, height: 0))
                    label.text = "\(name):\(confidence)"
                    label.font = self.resultInfoLabel.font
                    label.numberOfLines = 0
                    label.sizeToFit()
                    let height = label.frame.height * 2
                    
                    self.resultInfoLabel.text = "\(name):\(confidence)"
                    self.resultInfoLabel.frame.size.height = height
                    
                    print(prediction.classLabel)
                    print(prediction.classLabelProbs)
                }
            }catch let error as NSError {
                fatalError("Unexpected error ocurred: \(error.localizedDescription).")
            }
            
        }
        
    }
    
    func UiImageToCVPixelBuffer(from image:UIImage) -> CVPixelBuffer? {
        let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue,kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
        var pixelBuffer:CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault, Int.init(image.size.width), Int.init(image.size.height), kCVPixelFormatType_32ABGR, attrs, &pixelBuffer)
        guard (status == kCVReturnSuccess) else {
            return nil
        }
        
        CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags.init(rawValue: 0))
        let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)
        
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext.init(data: pixelData, width: Int.init(image.size.width), height: Int.init(image.size.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)
        
        context?.translateBy(x: 0, y: image.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        
        UIGraphicsPushContext(context!)
        image.draw(in: CGRect.init(x: 0, y: 0, width: image.size.width, height: image.size.height))
        UIGraphicsPopContext()
        CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags.init(rawValue: 0))
        
        return pixelBuffer
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NighthWeekOneVC {
    func startCapturingWithSession(captureSession cap: AVCaptureSession) {
        if previewLayer == nil {
            previewLayer = AVCaptureVideoPreviewLayer.init(session: cap)
            previewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
            previewLayer?.frame.origin = self.view.frame.origin
            previewLayer?.frame.size = self.view.frame.size
            self.view.layer.insertSublayer(previewLayer!, at: 1)
        }
        cap.startRunning()
    }
    
    func setUpResultInfoView() {
        resultInfoLabel.frame = CGRect.init(x: 10, y: view.bounds.size.height - 80, width: view.bounds.size.width - 20, height: 80)
        resultInfoLabel.textAlignment = .center
        resultInfoLabel.font = UIFont.systemFont(ofSize: 15)
        resultInfoLabel.textColor = UIColor.white
        resultInfoLabel.backgroundColor = UIColor.gray
        resultInfoLabel.numberOfLines = 0
        
        view.addSubview(resultInfoLabel)
    }
}
