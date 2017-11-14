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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
