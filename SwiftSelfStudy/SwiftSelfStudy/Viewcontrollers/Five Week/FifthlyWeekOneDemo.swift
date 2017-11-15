//
//  FifthlyWeekOneDemo.swift
//  SwiftSelfStudy
//
//  Created by hunuo on 2017/11/14.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class FifthlyWeekOneDemo: UIViewController,UITextFieldDelegate {

    /// 显示进度的view
    @IBOutlet var progressView: UIView!
    /// 显示进度的数字
    @IBOutlet var showProgressLabel: UILabel!
    /// 输入要显示的进度
    @IBOutlet var inputProgressTF: UITextField!
    
    
    // 已经进行进度
    var progressValue:CGFloat = 0.0
    
    var expectValue:CGFloat {
//        对输入的内容进行安全判断
        guard let valueText = inputProgressTF.text else {
            return 0
        }
        guard let value = NumberFormatter().number(from: valueText) else {
            return 0
        }
        if CGFloat(value) >= 0 && CGFloat(value) <= 100 {
            return CGFloat(value)
        }
        return 0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        basicShareLayer()
//        hollowLayer()
        inputProgressTF.delegate = self
        progressView.layer.addSublayer(circleLayer)
        progressView.layer.addSublayer(circleProgressLayer)
        
        showProgressLabel.text = "0.00%"
    }

    //MARK: - 动画按钮点击
    @IBAction func animateBtnClicked(_ sender: Any) {
        
        //初始化数值
        circleProgressLayer.strokeEnd = 0
        progressValue = 0
        
        //开启定时器
        timer = Timer.scheduledTimer(timeInterval: 0.04, target: self, selector: #selector(shoProgressAnimate), userInfo: nil, repeats: true)
    }
    
    @objc private func shoProgressAnimate() {
        
        if progressValue > expectValue - 1 && progressValue < expectValue {
            
            timer.invalidate()
            
            circleProgressLayer.strokeEnd = expectValue / 100
            showProgressLabel.text = "\(expectValue)%"
        
            return
        }
        
        if progressValue > expectValue {
            timer.invalidate()
            return
        }
        
//        更新进度文字和进度条的strokeEnd
        circleProgressLayer.strokeEnd = CGFloat(progressValue) / 100
        showProgressLabel.text = "\(progressValue)%"
        
        progressValue += 1
    }
    
    //MARK: - 懒加载
    lazy var timer = Timer()
    
    // 进度条的背景layer
    lazy var circleLayer:CAShapeLayer = {
        
        let bounds = CGRect.init(x: 0, y: 0, width: 250, height: 250)
        //固定的灰色进度圈
        let circleLayer = CAShapeLayer.init()
        
        circleLayer.bounds = bounds
        circleLayer.position = CGPoint.init(x: bounds.width / 2, y: bounds.height / 2)
        
        let circlePath = UIBezierPath.init(ovalIn: bounds)
        circleLayer.path = circlePath.cgPath
        
        circleLayer.lineWidth = 10
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.lightGray.cgColor
        
        return circleLayer
        
    }()
    
    // 进度条layer
    lazy var circleProgressLayer:CAShapeLayer = {
        
        let circleProgressLayer = CAShapeLayer.init()
        
        let circleBounds = CGRect.init(x: 0, y: 0, width: 250, height: 250)
        circleProgressLayer.bounds = circleBounds
        circleProgressLayer.position = CGPoint.init(x: circleBounds.width / 2, y: circleBounds.height / 2)
        
        let circleProgressPath = UIBezierPath.init(arcCenter: CGPoint.init(x: circleBounds.width / 2, y: circleBounds.height / 2), radius: circleBounds.height / 2, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        
        circleProgressLayer.strokeStart = 0
        circleProgressLayer.strokeEnd = 1
        circleProgressLayer.path = circleProgressPath.cgPath
        circleProgressLayer.lineWidth = 10
        circleProgressLayer.strokeColor = UIColor.init(colorLiteralRed: 0, green: 151, blue: 255, alpha: 1).cgColor
        circleProgressLayer.fillColor = UIColor.clear.cgColor
        
        return circleProgressLayer
    }()
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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

//MARK: - CAShapeLayer基础实用
extension FifthlyWeekOneDemo {
    ///基础shareLayer绘制
    fileprivate func basicShareLayer() {
        // 实例化CAShapeLayer
        let basicLayer = CAShapeLayer.init()
        // 设置layer的大小
        basicLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
//        将layer添加到视图上。
        view.layer.addSublayer(basicLayer)
//        设置layer的位置
        basicLayer.position = view.center
        
        //创建贝塞尔曲线
        let path = UIBezierPath.init(ovalIn: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        //将贝塞尔曲线作用在layer上
        basicLayer.path = path.cgPath
//        设置layer的填充色
        basicLayer.fillColor = UIColor.clear.cgColor
//        设置layer边框的填充色
        basicLayer.strokeColor = UIColor.red.cgColor
//        设置layer边框的宽度
        basicLayer.lineWidth = 2
        //设置layer边框的起点位置
        basicLayer.strokeStart = 0
        // 设置layer边框的重点位置
        basicLayer.strokeEnd = 1
        
        basicLayer.lineDashPattern = [5,2,10,5]
        
    }
    
     ///绘制空心进度的layer
    fileprivate func hollowLayer() {
        
        //创建空心的layer
        let hollowLayer = CAShapeLayer.init()
        hollowLayer.bounds = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        view.layer.addSublayer(hollowLayer)
        hollowLayer.position = view.center
        
        //最外面的圆角正方形path
        let squarePath = UIBezierPath.init(roundedRect: CGRect.init(x: 0, y: 0, width: 100, height: 100), cornerRadius: 5)
        //中间镂空的圆形path
        let hollowPath = UIBezierPath.init(ovalIn: CGRect.init(x: 10, y: 10, width: 80, height: 80))
        
        squarePath.append(hollowPath)
        hollowLayer.path = squarePath.cgPath
        
        hollowLayer.fillColor = UIColor.lightGray.cgColor
//        设置路径的填充模式为两个图形的非交集
        hollowLayer.fillRule = kCAFillRuleEvenOdd
        
        //创建进度layer
        let processSectorLayer = CAShapeLayer.init()
        view.layer.addSublayer(processSectorLayer)
        processSectorLayer.bounds = CGRect.init(x: 0, y: 0, width: 70, height: 70)
        processSectorLayer.position = view.center
        
        //进度的path  CGFloat radius = (self.bounds.size.width - lineWidth)/2;
        let processSectorPath = UIBezierPath.init(arcCenter: CGPoint.init(x: 35, y: 35), radius: 17.5, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        
        processSectorLayer.path = processSectorPath.cgPath
        processSectorLayer.lineWidth = 35;
        
        //进度的起点和结束位置,设置进度条修改这个值和结束数值即可
        processSectorLayer.strokeStart = 0.1
        processSectorLayer.strokeEnd = 0.9
        
        processSectorLayer.strokeColor = UIColor.lightGray.cgColor
        processSectorLayer.fillColor = UIColor.clear.cgColor
        
    }
    
}
