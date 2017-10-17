//
//  FirstWeekTwoDemo.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/10/18.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class FirstWeekTwoDemo: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView:UITableView!
    var dataArray:NSMutableArray!
    let sortArray = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.downloadData()
        self.createUI()
        
    }
    
    func downloadData() {
        self.dataArray = NSMutableArray()
        for charTmp in self.sortArray {
            let array = NSMutableArray()
            let number = arc4random() % 10 + 1
            
            for index in 1...number {
                let text = String.init(format: "%@-%ld", arguments: [charTmp,index])
                array.add(text)
            }
            
            let dict = NSMutableDictionary()
            dict.setObject(array, forKey: "sectionArray" as NSCopying)
            dict.setObject(charTmp, forKey: "sectionTitle" as NSCopying)
            
            self.dataArray.add(dict)
        }
    }
    
    func createUI() {
        tableView = UITableView.init(frame: UIScreen.main.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.sectionIndexColor = UIColor.blue //索引值颜色
        // 设置选中索引时的背景颜色
        tableView.sectionIndexTrackingBackgroundColor = UIColor.clear
        tableView.sectionIndexBackgroundColor = UIColor.clear //设置索引的背景颜色
        self.view.addSubview(tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dict:NSDictionary = self.dataArray.object(at: section) as! NSDictionary
        let arr:NSArray = dict.object(forKey: "sectionArray") as! NSArray
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let dict:NSDictionary = self.dataArray.object(at: indexPath.section) as! NSDictionary
        let arr:NSArray = dict.object(forKey: "sectionArray") as! NSArray
        let str = arr.object(at: indexPath.row) as! String
        cell.textLabel?.text = str
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sortArray
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let dict:NSDictionary = self.dataArray[section] as! NSDictionary
        let text:String = dict.object(forKey: "sectionTitle") as! String
        return text
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
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
