//
//  FourthlyWeekFourDemo.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/11/8.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class FourthlyWeekFourDemo: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor.blue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置遮罩层position
        maskLayer.position = view.center
         //设置controller view的遮罩层
       self.view.layer.mask = maskLayer
        //遮罩层添加动画效果
        self.view.layer.mask?.add(maskAnimation(), forKey: nil)
    }
    
    lazy var maskLayer:CALayer = {
        let layer = CALayer.init()
        layer.bounds = CGRect.init(x: 0, y: 0, width: 50, height: 50)
        layer.contents = UIImage.init(named: "twitter logo mask")?.cgImage
        return layer
    }()
    
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

extension FourthlyWeekFourDemo {
    fileprivate func maskAnimation() -> (CAKeyframeAnimation){
        //        放大缩小视图，keypath使用bounds
        let maskAnimate = CAKeyframeAnimation.init(keyPath: "bounds")
//        动画时间
        maskAnimate.duration = 1.25
        //        动画延迟0.5秒播放
        maskAnimate.beginTime = CACurrentMediaTime() + 0.5
        // 设置关键帧动画的数值
        let startRect = maskLayer.frame
        let tempRect = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        let finalRect = CGRect.init(x: 0, y: 0, width: 2000, height: 2000)
        maskAnimate.values = [startRect,tempRect,finalRect]
        
        //        设置关键帧动画的运动节奏
        maskAnimate.timingFunctions = [CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut),CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut),CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)]
        //        动画播放结束后是否移除动画
        maskAnimate.isRemovedOnCompletion = false
        //        动画填充模式：kCAFillModeForwards:当动画结束后，layer会一直保持着动画最后的状态
        maskAnimate.fillMode = kCAFillModeForwards
        
        return maskAnimate
    }
}
