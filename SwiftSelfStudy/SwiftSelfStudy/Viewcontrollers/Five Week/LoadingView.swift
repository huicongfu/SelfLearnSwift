//
//  LoadingView.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/11/17.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class LoadingView: UIView {

    var colors:[UIColor] = [#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1),#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1),#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)]
    var duration = 2.0
    var interval = 1.0
    
    fileprivate var lineLength:CGFloat!
    fileprivate var lineWidth:CGFloat!
    fileprivate var margin:CGFloat!
    fileprivate var lines:[CAShapeLayer] = []
    fileprivate let angle:CGFloat = -30
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupConfig()
    }
    
    init(frame: CGRect,colors:[UIColor]) {
        super.init(frame: frame)
        self.colors = colors
        setupConfig()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConfig()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

extension LoadingView {
    fileprivate func setupConfig() {
        lineWidth = min(kWidth, kHeight) / 5
        lineLength = min(kWidth, kHeight)
        margin = lineWidth * 1.5
        
        setupUI()
        setupAnimate()
    }
}

// MARK: - UI
extension LoadingView {
    fileprivate func setupUI() {
        createLine()
        transform = CGAffineTransform.init(rotationAngle: angleToRadian(angle))
    }
    
    // MARK: - 绘制四根直线(蓝黄红绿)
    fileprivate func createLine() {
        
        let start = [CGPoint(x: lineWidth * 0.5, y: margin),
                     CGPoint(x: lineLength - margin, y: 0 + lineWidth * 0.5),
                     CGPoint(x: lineLength - lineWidth * 0.5, y: lineLength - margin),
                     CGPoint(x: margin, y: lineLength - lineWidth * 0.5)]
        
        let end = [CGPoint(x: lineLength - lineWidth * 0.5, y: margin),
                   CGPoint(x: lineLength - margin, y: lineLength - lineWidth * 0.5),
                   CGPoint(x: lineWidth * 0.5, y: lineLength - margin),
                   CGPoint(x: margin, y: 0 + lineWidth * 0.5)]
        
        for i in 0..<4 {
            let path = linePathMake(start: start[i], end: end[i])
            let lineLayer = capShapeMake(lineWidth: lineWidth, color: colors[i], path: path)
            lines.append(lineLayer)
            layer.addSublayer(lineLayer)
            
        }
        
    }
    
    fileprivate func linePathMake(start:CGPoint,end:CGPoint) -> UIBezierPath {
        let linePath = UIBezierPath.init()
        linePath.move(to: start)
        linePath.addLine(to: end)
        return linePath
        
    }
    
    fileprivate func capShapeMake(lineWidth:CGFloat,color:UIColor,path:UIBezierPath) -> CAShapeLayer {
        
        let capLayer = CAShapeLayer.init()
        capLayer.lineWidth = lineWidth
        capLayer.strokeColor = color.cgColor
        capLayer.lineCap = kCALineCapRound
        capLayer.opacity = 0.8
        capLayer.path = path.cgPath
        return capLayer
        
    }
    
    func angleToRadian(_ angle:CGFloat) -> CGFloat {
        return angle * .pi / 180
    }
}

// MARK: - 动画
extension LoadingView {
    fileprivate func setupAnimate() {
        let rotateDuration = duration * 3 / 4
        //收缩时间
        let shrinkDuration = duration / 4
        let offsetDuration = shrinkDuration
        let offsetBegin = CACurrentMediaTime() + shrinkDuration
        let stretchDuration = shrinkDuration
        let stretchBegin = CACurrentMediaTime() + rotateDuration
        
        rotateAnim(duration: rotateDuration)
        shrinkAnim(duration: shrinkDuration)
        offsetAnim(duration: offsetDuration, offsetBegin)
        stretchAnim(duration: stretchDuration, stretchBegin)
        
    }
    
    // MARK: 旋转动画
    fileprivate func rotateAnim(duration:CFTimeInterval,_ begin:CFTimeInterval = CACurrentMediaTime()) {
        
        let anim = CABasicAnimation.init(keyPath: "transform.rotation.z")
        anim.fromValue = angleToRadian(angle)
        anim.toValue = angleToRadian(angle + 360*2)
        anim.fillMode = kCAFillModeForwards
        anim.isRemovedOnCompletion = false
        anim.beginTime = begin
        anim.delegate = self
        anim.duration = duration
        layer.add(anim, forKey: nil)
        
    }
    
    // MARK: 收缩动画
    fileprivate func shrinkAnim(duration:CFTimeInterval,_ begin:CFTimeInterval = CACurrentMediaTime()) {
        
        let anim = CABasicAnimation.init(keyPath: "strokeEnd")
        anim.beginTime = begin
        anim.duration = duration
        anim.fillMode = kCAFillModeForwards
        anim.isRemovedOnCompletion = false
        anim.fromValue = 1
        anim.toValue = 0
        
        for i in 0..<4 {
            lines[i].add(anim, forKey: nil)
        }
    }
    
    // MARK: 位移动画
    fileprivate func offsetAnim(duration:CFTimeInterval,_ begin:CFTimeInterval = CACurrentMediaTime()) {
        
        let anim = CABasicAnimation.init()
        for i in 0..<4 {
            let path = (i % 2 == 1) ? "transform.translation.y" : "transform.translation.x"
            anim.keyPath = path
            anim.beginTime = begin
            anim.duration = duration
            anim.fillMode = kCAFillModeForwards
            anim.isRemovedOnCompletion = false
            anim.autoreverses = true
            anim.fromValue = 0
            anim.toValue = (i < 2) ? lineLength / 4 : -lineLength / 4
            lines[i].add(anim, forKey: nil)
            
        }
        
    }
    
    // MARK: 伸长动画
    fileprivate func stretchAnim(duration:CFTimeInterval,_ begin:CFTimeInterval = CACurrentMediaTime()) {
        
        let anim = CABasicAnimation.init(keyPath: "strokeEnd")
        anim.beginTime = begin
        anim.duration = duration
        anim.fillMode = kCAFillModeForwards
        anim.isRemovedOnCompletion = false
        anim.fromValue = 0
        anim.toValue = 1
        
        for i in 0..<4 {
            lines[i].add(anim, forKey: nil)
        }
        
    }
    
}

extension LoadingView:CAAnimationDelegate {
    
    func animationDidStart(_ anim: CAAnimation) {
        
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        layer.removeAllAnimations()
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            self.setupAnimate()
        }
    }
    
}
