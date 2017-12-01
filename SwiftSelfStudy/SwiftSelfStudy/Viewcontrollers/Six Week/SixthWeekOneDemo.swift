//
//  SixthWeekOneDemo.swift
//  SwiftSelfStudy
//
//  Created by hunuo on 2017/11/23.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class SixthWeekOneDemo: UIViewController {
    
    let kLand_Begin_Height = kHeight-20
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let roller = RollerCoasterLayer.init(frame: self.view.bounds)
//        self.view.layer.addSublayer(roller)
       self.createUI()
    }
    
    func createUI() {
        view.backgroundColor = UIColor.lightGray
//        初始化背景渐变的天空
        initBackgroundSky()
        //    初始化雪山
        initSnowberg()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
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

extension SixthWeekOneDemo {
    
    //MARK: - 初始化背景天空渐变色
    func initBackgroundSky() {
        let backgroundLayer = CAGradientLayer.init()
//        设置背景渐变色层的大小。要减去屏幕最下方土地那条水平线的高度
        backgroundLayer.frame = CGRect.init(x: 0, y: 0, width: kWidth, height: kLand_Begin_Height);
        let lightColor = UIColor.init(red: 40.0 / 255.0, green: 150.0 / 255.0, blue: 200.0 / 255.0, alpha: 1.0)
        let darkColor = UIColor.init(red: 255.0 / 255.0, green: 250.0 / 255.0, blue: 250.0 / 255.0, alpha: 1.0)
        backgroundLayer.colors = [lightColor.cgColor,darkColor.cgColor];
        
        //    让变色层成45度角变色
        backgroundLayer.startPoint = CGPoint.init(x: 0, y: 0)
        backgroundLayer.endPoint = CGPoint.init(x: 1, y: 1)
        
        self.view.layer.addSublayer(backgroundLayer)
    }
    
    //MARK: - 初始化雪山
    func initSnowberg() {
        //左边第一座山顶,其实就是一个白色的三角形
        let leftSnowberg = CAShapeLayer.init()
        let leftSnowbergPath = UIBezierPath.init()
        
//        把bezierpath的起点移动到雪山左下角
        leftSnowbergPath.move(to: CGPoint.init(x: 0, y: kHeight - 120))
//        画一条线到山顶
        leftSnowbergPath.addLine(to: CGPoint.init(x: 100, y: 100))
//        画一条线到右下角->左下角->闭合
        leftSnowbergPath.addLine(to: CGPoint.init(x: kWidth / 2, y: kLand_Begin_Height))
        leftSnowbergPath.addLine(to: CGPoint.init(x: 0, y: kLand_Begin_Height))
        leftSnowbergPath.close()
        
        leftSnowberg.path = leftSnowbergPath.cgPath
        leftSnowberg.fillColor = UIColor.white.cgColor
        self.view.layer.addSublayer(leftSnowberg)
        
//       开始画山体没有被雪覆盖的部分
        let leftSnowBergBody = CAShapeLayer.init()
        let leftSnowBergBodyPath = UIBezierPath.init()
        
//        把bezierpath的起点移动到雪山左下角相同的位置
        let startPoint = CGPoint.init(x: 0, y: kHeight - 120)
        let endPoint = CGPoint.init(x: 100, y: 100)
        let firstPathPoint = self.calculateWith(xvalue: 20, startPoint: startPoint, endPoint: endPoint)
        leftSnowBergBodyPath.move(to: startPoint)
        
        leftSnowBergBodyPath.addLine(to: firstPathPoint)
        leftSnowBergBodyPath.addLine(to: CGPoint.init(x: 60, y: firstPathPoint.y))
        leftSnowBergBodyPath.addLine(to: CGPoint.init(x: 100, y: firstPathPoint.y + 30))
        leftSnowBergBodyPath.addLine(to: CGPoint.init(x: 140, y: firstPathPoint.y))
        leftSnowBergBodyPath.addLine(to: CGPoint.init(x: 180, y: firstPathPoint.y - 20))
        
        let secondPathPoint = self.calculateWith(xvalue: kWidth / 2 - 125, startPoint: endPoint, endPoint: CGPoint.init(x: kWidth / 2, y: kLand_Begin_Height))
        leftSnowBergBodyPath.addLine(to: CGPoint.init(x: secondPathPoint.x - 30, y: firstPathPoint.y))
        
        leftSnowBergBodyPath.addLine(to: secondPathPoint)
        
        leftSnowBergBodyPath.addLine(to: CGPoint.init(x: kWidth / 2, y: kLand_Begin_Height))
        leftSnowBergBodyPath.addLine(to: CGPoint.init(x: 0, y: kLand_Begin_Height))
        leftSnowBergBodyPath.close()
        
        leftSnowBergBody.path = leftSnowBergBodyPath.cgPath
        let snowColor = UIColor.init(displayP3Red: 139.0/255.0, green: 92.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        leftSnowBergBody.fillColor = snowColor.cgColor
        self.view.layer.addSublayer(leftSnowBergBody)
    }
    
    //MARK: - 根据起始点，算出指定的x在这条线段上对应的y。知道两点，根据两点坐标，求出两点连线的斜率。y=kx+b求出点坐标
    func calculateWith(xvalue:CGFloat,startPoint:CGPoint,endPoint:CGPoint) -> CGPoint {
//        求出两点连线的斜率
        let k = (endPoint.y - startPoint.y) / (endPoint.x - startPoint.x)
        let b = startPoint.y - startPoint.x * k
        let yvalue = k * xvalue + b
        return CGPoint.init(x: xvalue, y: yvalue)
    }
}
