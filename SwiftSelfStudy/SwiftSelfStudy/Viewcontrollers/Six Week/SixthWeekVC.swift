//
//  SixthWeekVC.swift
//  SwiftSelfStudy
//
//  Created by hunuo on 2017/11/23.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

private let cellId = "cellId6"

class SixthWeekVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let dataArray = ["第一个-过山车","第二个-"]
    var tableView = UITableView.init(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
    override func viewDidLoad() {
        super.viewDidLoad()

        self.createUI()
    }
    
    func createUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        self.view.addSubview(tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = SixthWeekOneDemo.init()
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = FifthlyWeekTwoDemo()
            vc.navigationItem.title = dataArray[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
            
        default:
            break
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
