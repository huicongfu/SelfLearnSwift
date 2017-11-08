//
//  FourthlyWeekTwoDemo.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/11/7.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class FourthlyWeekTwoDemo: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var grayView: UIView!
    @IBOutlet var greenView: UIView!
    @IBOutlet var orangeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = "吓死宝宝了！"
        //暂时先隐藏头部标题，等动画播放完成再显示
        self.titleLabel.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //添加阻尼动画
        UIView.animate(withDuration: 0.8, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: UIViewAnimationOptions(), animations: {
            
            //改变黄色View的中心点位置
            self.orangeView.center.x = self.view.bounds.width - self.orangeView.center.x
            self.orangeView.center.y = self.orangeView.center.y + 30
            //改变绿色View的中心点位置
            self.greenView.center.x = self.view.bounds.width - self.greenView.center.x
             self.greenView.center.y = 30 + self.greenView.center.y
            // 改变灰色view的位置
            self.grayView.center.y = self.grayView.center.y + 30
            self.grayView.frame.size.height = 150
            
            self.view.layoutIfNeeded()
            
        }) { (result) in
//            如果上面的动画执行完成，执行下面的动画
            if result {
                UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: UIViewAnimationOptions(), animations: { 
                    self.titleLabel.isHidden = false
                }, completion: { (result) in
                    
                })
            }
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
