//
//  GyroBallView.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/12/1.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit
import CoreMotion

class GyroBallView: UIView {

    var lastUpdateTime: Date? = nil
    //图片的宽高
    var imageWidth:CGFloat = 50
    var imageHeight:CGFloat = 50
    
    var accelleration = CMAcceleration.init()
    var imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
    
    //球在XY方向速度
    var ballXVelocity:Double = 0
    var ballYVelocity:Double = 0
    
    //当前ImageView位置
    var currentPoint = CGPoint() {
        didSet{
            //对球在X轴碰壁进行处理
            if currentPoint.x <= imageWidth / 2 {
                currentPoint.x = imageWidth / 2
                ballXVelocity = -ballXVelocity * 0.8
            }
            
            if currentPoint.x > bounds.size.width - imageWidth / 2 {
                currentPoint.x = bounds.size.width - imageWidth / 2
                ballXVelocity = -ballXVelocity * 0.8
            }
            
            //对球在Y轴碰壁进行处理
            if currentPoint.y <= imageHeight / 2 {
                currentPoint.y = imageHeight / 2
                ballYVelocity = -ballYVelocity * 0.8
            }
            
            if currentPoint.y >= bounds.size.height - imageHeight / 2 {
                currentPoint.y = bounds.size.height - imageHeight / 2
                ballYVelocity = -ballYVelocity * 0.8
            }
            
            imageView.center = currentPoint
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = UIColor.lightGray
        imageView.image = UIImage.init(named: "ball")
        addSubview(imageView)
        
        currentPoint = center
        imageView.center = currentPoint
    }
    
    func updateLocation(multiplier:Double) {
        if (lastUpdateTime != nil) {
            let updatePeriod:Double = Date.init().timeIntervalSince(lastUpdateTime!)
            
            ballXVelocity = ballXVelocity + accelleration.x * updatePeriod
            ballYVelocity = ballYVelocity + accelleration.y * updatePeriod
            //系数
            let coefficient = updatePeriod * multiplier
            currentPoint = CGPoint.init(x: currentPoint.x + (CGFloat)(ballXVelocity * coefficient), y: currentPoint.y - (CGFloat)(ballYVelocity * coefficient))
            
        }
        lastUpdateTime = Date.init()
    }
}
