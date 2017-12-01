//
//  SevenWeekOneDemo.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/12/1.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit
import CoreMotion

class SevenWeekOneDemo: UIViewController {
    
    var coreManager = CMMotionManager.init()
    var ballView: GyroBallView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ballView = GyroBallView.init(frame: view.bounds)
        playBall()
    }
    
    private func playBall() {
        ballView?.backgroundColor = UIColor.clear
        view.addSubview(ballView!)
        
        coreManager.deviceMotionUpdateInterval = 1 / 60
        //注意一下，在Swift没有了NSOperation。被OperationQueue取代了。
        coreManager.startDeviceMotionUpdates(to: OperationQueue.main) { (motion, error) in
            self.ballView?.accelleration = (motion?.gravity)!
            //开启主队列异步线程，更新球的位置
            DispatchQueue.main.async {
                self.ballView?.updateLocation(multiplier: 5000)
            }
        }
    }
    //    MARK: - 陀螺仪的两种获取数据方法PUSH & PULL
    private func useGyroPull() {
        //判断陀螺仪可不可用
        if coreManager.isGyroAvailable {
            //设置陀螺仪多久采样一次
            coreManager.gyroUpdateInterval = 0.1
            //开始更新，后台线程开始运行，这就是Pull方式
            coreManager.startGyroUpdates()
        }
        //获取并处理陀螺仪数据，这里简单打印
        print("X = \(coreManager.gyroData?.rotationRate.x ?? 0)","Y = \(coreManager.gyroData?.rotationRate.y ?? 0)","Z = \(coreManager.gyroData?.rotationRate.z ?? 0)")
    }
    
    private func useGyroPush() {
        if coreManager.isGyroAvailable {
            //设置陀螺仪多久采样一次
            coreManager.gyroUpdateInterval = 0.1
            //Push方式获取和处理数据，这里我们一样只是做了简单的打印。把采样的工作放在了主线程中。
            coreManager.startGyroUpdates(to: OperationQueue.main, withHandler: { (gyroData, error) in
                 print("X = \(self.manager.gyroData?.rotationRate.x ?? 0)","Y = \(self.manager.gyroData?.rotationRate.y ?? 0)","Z = \(self.manager.gyroData?.rotationRate.z ?? 0)")
            })
        }else {
            print("陀螺仪不可用")
        }
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
