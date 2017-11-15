//
//  FifthlyWeekTwoDemo.swift
//  SwiftSelfStudy
//
//  Created by hunuo on 2017/11/15.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class FifthlyWeekTwoDemo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.createUI()
//        self.createUITwo()
    }
    
    func createUI() {
        let layer = CALayer.init()
        layer.frame = CGRect.init(x: 0, y: 100, width: 10, height: 80)
        layer.backgroundColor = UIColor.white.cgColor
        layer.anchorPoint = CGPoint.init(x: 0.5, y: 0.5)
        layer.add(self.scaleYAnimation(), forKey: "scaleAnimation")
        
        let replicatorLayer = CAReplicatorLayer.init()
        replicatorLayer.frame = CGRect.init(x: 0, y: 0, width: 80, height: 80)
        
        //设置复制层里面包含子层的个数
        replicatorLayer.instanceCount = 6
        //设置子层相对于前一层的偏移量
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(45, 0, 0)
        //设置子层相对于前一层的延迟时间
        replicatorLayer.instanceDelay =  0.2
        //设置层的颜色，(前提是要设置层的背景颜色，如果没有设置背景颜色，默认是透明的，再设置这个属性不会有效果。
        replicatorLayer.instanceColor = UIColor.green.cgColor
        //颜色的渐变,相对于前一个层的渐变(取值-1~+1),RGB有三种颜色，所以这里也是绿红蓝三种。
        replicatorLayer.instanceGreenOffset = -0.2
        replicatorLayer.instanceRedOffset = -0.2
        replicatorLayer.instanceBlueOffset = -0.2
        
//        需要把子层加入到复制层中，复制层按照前面设置的参数自动复制
        replicatorLayer.addSublayer(layer)
        //将复制层加入view的层里面进行显示
        view.layer.addSublayer(replicatorLayer)
        
        
    }
    
    func createUITwo() {
//         为了不一样，我们设置了第二个复制层。第二个复制层修改了复制的锚点、复制的个数、复制的偏移量
        let secondLayer = CALayer.init()
        secondLayer.frame = CGRect.init(x: 0, y: 150, width: 10, height: 80)
        secondLayer.backgroundColor = UIColor.white.cgColor
        secondLayer.anchorPoint = CGPoint.init(x: 0, y: 1)
        secondLayer.add(self.scaleYAnimation(), forKey: "scaleAnimation")
        
        let secondReplicatorLayer = CAReplicatorLayer.init()
        secondReplicatorLayer.frame = CGRect.init(x: 0, y: 100, width: 200, height: 80)
        
        secondReplicatorLayer.instanceCount = 20
//        复制的位移不仅有x轴的，还加入了y轴的
        secondReplicatorLayer.instanceTransform = CATransform3DMakeTranslation(30, 20, 0)
        
        secondReplicatorLayer.instanceDelay = 0.05
        secondReplicatorLayer.instanceColor = UIColor.orange.cgColor
        secondReplicatorLayer.instanceGreenOffset = -0.1
        secondReplicatorLayer.instanceRedOffset = -0.1
        secondReplicatorLayer.instanceBlueOffset = -0.1
        
        secondReplicatorLayer.addSublayer(secondLayer)
        view.layer.addSublayer(secondReplicatorLayer)
        
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

extension FifthlyWeekTwoDemo {
    fileprivate func scaleYAnimation() -> CABasicAnimation {
        let animat = CABasicAnimation.init(keyPath: "transform.scale.y")
        animat.toValue = 0.1
        animat.duration = 0.4
        animat.autoreverses = true
        animat.repeatCount = MAXFLOAT
        
        return animat
    }
}
