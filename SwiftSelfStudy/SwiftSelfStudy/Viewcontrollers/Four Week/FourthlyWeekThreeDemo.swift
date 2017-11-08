//
//  FourthlyWeekThreeDemo.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/11/8.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class FourthlyWeekThreeDemo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.createUI()
    }
    
    func createUI() {
        let heartImage = UIImage.init(named: "heart")
        // 创建心层
        let heartLayer = CALayer.init()
        heartLayer.position = CGPoint.init(x: self.view.center.x, y: 120)
        heartLayer.backgroundColor = UIColor.white.cgColor
        heartLayer.bounds = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        self.view.layer.addSublayer(heartLayer)
        heartLayer.contents = heartImage?.cgImage
        
        //创建动画
        let scaleAnimate = CABasicAnimation.init()
        //设置动画属性
        scaleAnimate.keyPath = "transform.scale"
        //设置动画的起始位置。也就是动画从哪里到哪里。不指定起点，默认就从positoin开始
        scaleAnimate.toValue = 0.5
        scaleAnimate.duration = 1.0
        //动画的节奏
        scaleAnimate.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        //
        scaleAnimate.repeatCount = .greatestFiniteMagnitude
        //添加动画
        heartLayer.add(scaleAnimate, forKey: nil);
        
        //头像图层
        let headImageView = UIImageView.init(image: UIImage.init(named: "head4"))
        self.view.addSubview(headImageView)
        
        headImageView.center = self.view.center
        headImageView.bounds = CGRect.init(x: 0, y: 0, width: 200, height: 200)
        
        UIView.animate(withDuration: 2.0) { 
            headImageView.alpha = 0
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

