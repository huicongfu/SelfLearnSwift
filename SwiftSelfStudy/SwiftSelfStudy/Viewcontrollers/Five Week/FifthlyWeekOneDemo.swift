//
//  FifthlyWeekOneDemo.swift
//  SwiftSelfStudy
//
//  Created by hunuo on 2017/11/14.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class FifthlyWeekOneDemo: UIViewController {

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

        basicShareLayer()
    }

    @IBOutlet var animaBtnClck: UIButton!
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
    fileprivate func basicShareLayer (){
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
}
