//
//  SecondWeekFourthlyDemo.swift
//  SwiftSelfStudy
//
//  Created by hunuo on 2017/10/27.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

let cellId4 = "SecondWeekFourthlyDemo"

class SecondWeekFourthlyDemo: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView = UITableView.init(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationItem.setHidesBackButton(true, animated: true)
        
        self.createUI()
    }
    
    func createUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "SecondWeekFourthlyCell", bundle: Bundle.main), forCellReuseIdentifier: cellId4)
        tableView.tableFooterView = UIView()
        self.view.addSubview(tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId4, for: indexPath) as! SecondWeekFourthlyCell
        cell.cellTitleLabel.text = "Pattern \(indexPath.section) Buildding\(indexPath.row)"
        
        cell.cellImageView.image = indexPath.row % 2 == 0 ? UIImage.init(named: "401") : UIImage.init(named: "402")
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delteBtn = UITableViewRowAction.init(style: .default, title: "✖️\ndelete ") { (UITableViewRowAction, IndexPath) in
            print("delete")
        }
        delteBtn.backgroundColor = UIColor.gray
        
        
        let shareBtn = UITableViewRowAction.init(style: .default, title: "🤗\nshare") { (UITableViewRowAction, IndexPath) in
            print("share")
            let arr = [UIActivityType.airDrop,UIActivityType.message,UIActivityType.copyToPasteboard,UIActivityType.assignToContact,UIActivityType.postToWeibo,UIActivityType.mail,UIActivityType.saveToCameraRoll]
            let activity = UIActivityViewController.init(activityItems: arr, applicationActivities: nil)
            self.navigationController?.present(activity, animated: true, completion: { 
                
            })
        }
        
        let downloadBtn = UITableViewRowAction.init(style: .default, title: "⬇️\ndownload") { (UITableViewRowAction, IndexPath) in
            print("download")
        }
        downloadBtn.backgroundColor = UIColor.blue
        
        return [downloadBtn,shareBtn,delteBtn]
        
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
