//
//  SecondWeekOneDemo.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/10/24.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class SecondWeekOneDemo: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var tableView:UITableView?
    var dataArray = NSMutableArray.init()
    
    
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
        self.downloadData()
    }
    
    func downloadData() {
        for i in 0..<2 {
            let arr = NSMutableArray.init()
            for j in 0..<5 {
                let dict = NSMutableDictionary.init()
                let headImage = String.init(format: "men%d.jpg", j%2)
                let name = String.init(format: "name_%d", j)
                let mobile = String.init(format: "555-123-456%d", j)
                let email = String.init(format: "fu%d@apple.com", j)
                let notes = String.init(format: "Hello everone my name is John appleseed,i come form social mediaholic,amateur beer junkie.food fanatic %d", j)
                dict["headImage"] = headImage
                dict["name"] = name
                dict["mobile"] = mobile
                dict["email"] = email
                dict["notes"] = notes
                let model = SecondWeekOneDemoModel.init(dict: dict as! [String : Any])
                arr.add(model)
            }
            self.dataArray.add(arr)
        }
        self.tableView?.reloadData()
    }
    
    func createUI() {
        self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kWidth, height: kHeight), style: .grouped)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView!)
        self.tableView?.tableFooterView = UIView.init()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arr:NSArray = self.dataArray[section] as! NSArray
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let arr:NSArray = self.dataArray[indexPath.section] as! NSArray
        let model:SecondWeekOneDemoModel = arr[indexPath.row] as! SecondWeekOneDemoModel
        cell?.imageView?.image = UIImage.init(named: model.headImage)
        print(model.headImage)
        cell?.imageView?.layer.cornerRadius = 22.0
        cell?.imageView?.clipsToBounds = true
        cell?.textLabel?.text = model.name
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kWidth, height: 44))
        headView.backgroundColor = UIColor.lightGray
        return headView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
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
