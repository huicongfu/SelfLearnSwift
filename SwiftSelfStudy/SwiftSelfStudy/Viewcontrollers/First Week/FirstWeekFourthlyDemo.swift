//
//  FirstWeekFourthlyDemo.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/10/22.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

let kWidth = UIScreen.main.bounds.size.width

class FirstWeekFourthlyDemo: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var tableView:UITableView?
    var dataArray:NSMutableArray = NSMutableArray.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.createUI()
        self.downloadData()
    }
    
    func downloadData() {
        let path = Bundle.main.path(forResource: "countryData", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        do {
            let data = try Data(contentsOf: url)
            let jsonData:Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
            let jsonArr = jsonData as! NSArray
            for dict in jsonArr {
                let model = FirstWeekFourthlyModel.init(dict: dict as! [String : AnyObject])
                self.dataArray.add(model)
            }
            self.tableView?.reloadData()
        } catch let error as Error! {
            print("读取本地数据出现错误!",error)
        }
        
    }
    
    func createUI() {
        self.tableView = UITableView.init(frame: UIScreen.main.bounds, style: .plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.tableFooterView = UIView.init()
        self.view.addSubview(self.tableView!)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let model:FirstWeekFourthlyModel = self.dataArray[section] as! FirstWeekFourthlyModel
        return (model.childData?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "cellId"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellId)
        }
        cell?.textLabel?.text = "cell \(indexPath.row)";
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kWidth, height: 44))
        headView.backgroundColor = UIColor.gray
        return headView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
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
