//
//  SecondWeekOneDemo.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/10/24.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class SecondWeekOneDemo: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = UIColor.init(colorLiteralRed: 34/255.0, green: 145/255.0, blue: 248/255.0, alpha: 1.0)
        self.navigationItem.title = "Contacts"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        let leftItem = UIBarButtonItem.init(image: UIImage.init(named: "setting"), style: .plain, target: self, action: #selector(leftClick))
        self.navigationItem.setLeftBarButton(leftItem, animated: true)
        let rightItem = UIBarButtonItem.init(image: UIImage.init(named: "add"), style: .plain, target: self, action: #selector(leftClick))
        self.navigationItem.setRightBarButton(rightItem, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.black]
    }
    
    func leftClick() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createUI()
    }
    
    func createUI() {
        
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
