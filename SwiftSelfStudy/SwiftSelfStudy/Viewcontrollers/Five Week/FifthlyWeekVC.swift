//
//  FifthlyWeekVC.swift
//  SwiftSelfStudy
//
//  Created by hunuo on 2017/11/14.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

private let cellId = "cellId"

class FifthlyWeekVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let dataArray = ["第一个-动态流量图","第二个-播放指示器","第三个-","第四个-"]
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
            let vc = FifthlyWeekOneDemo.init()
            vc.navigationItem.title = dataArray[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = FifthlyWeekTwoDemo()
            vc.navigationItem.title = dataArray[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 2:
            let vc = FourthlyWeekThreeDemo()
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 3:
            let vc = FourthlyWeekFourDemo()
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
