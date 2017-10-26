//
//  SecondWeekOneDemoDetail.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/10/26.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class SecondWeekOneDemoDetail: UIViewController {
    
    var model:SecondWeekOneDemoModel! = nil
    
    @IBOutlet var headImage: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var mobileLabel: UILabel!
    
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var notesLabel: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = UIColor.init(colorLiteralRed: 34/255.0, green: 145/255.0, blue: 248/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.white

        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        let rightItem = UIBarButtonItem.init(title: "Edit", style: .plain, target: self, action: #selector(leftClick))
        rightItem.tintColor = UIColor.white
        self.navigationItem.setRightBarButton(rightItem, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.black]
        self.navigationController?.navigationBar.tintColor = UIColor.blue
    }
    
    func leftClick() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.headImage.clipsToBounds = true
        self.headImage.layer.cornerRadius = 40.0
        
        self.headImage.image = UIImage.init(named: model.headImage)
        self.nameLabel.text = model.name
        self.mobileLabel.text = model.mobile
        self.emailLabel.text = model.email
        self.notesLabel.text = model.notes
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
