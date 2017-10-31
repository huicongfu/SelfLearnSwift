//
//  ViewController.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/10/12.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit


private let cellID = "cellId"

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView = UITableView.init(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
    var dataArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Swift Demo"
        
        for index in 0..<4 {
            dataArray.add("第\(index+1)周Demo")
        }
        
        self.createUI()
    }
    
    private func createUI() {
        
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView()
//        tableView.tintColor = UIColor.black
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        self.view.addSubview(tableView)
    }
    
   // MARK: - delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        if dataArray.count > 0 {
            cell.textLabel?.text = dataArray[indexPath.row] as? String
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = FirstWeekVC()
            vc.navigationItem.title = dataArray[indexPath.row] as? String
            self.navigationController?.pushViewController(vc , animated: true)
//            break
        case 1:
            let vc = SecondWeekVC()
            vc.navigationItem.title = dataArray[indexPath.row] as? String
            self.navigationController?.pushViewController(vc , animated: true)
//            break
        case 2:
            let vc = ThirdWeekVC()
            vc.navigationItem.title = dataArray[indexPath.row] as? String
            self.navigationController?.pushViewController(vc , animated: true)
//            break
            
        default: break
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

