//
//  SixthWeekOneDemo.swift
//  SwiftSelfStudy
//
//  Created by hunuo on 2017/11/23.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class SixthWeekOneDemo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let roller = RollerCoasterLayer.init(frame: self.view.bounds)
        self.view.layer.addSublayer(roller)
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
