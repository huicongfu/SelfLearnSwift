//
//  ThirdWeekFifthDetailVC.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/11/4.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class ThirdWeekFifthDetailVC: UIViewController {
    
    @IBOutlet var headImageView: UIImageView!
    var imageStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headImageView.image = UIImage.init(named: imageStr)
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
