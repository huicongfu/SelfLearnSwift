//
//  SecondWeekThreeDemo.swift
//  SwiftSelfStudy
//
//  Created by hunuo on 2017/10/27.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class SecondWeekThreeDemo: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView:UITableView!
    var dataArray:NSMutableArray = NSMutableArray.init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.createUI()
        self.downloadData()
    }
    
    func downloadData() {
        for index in 0..<4 {
            let model = SecondWeekThirdDemoModel.init()
            model.timeStr = "2017-10-2\(index)"
            model.titleStr = "Go To \(index)"
            model.type = ListType(rawValue: index)!
            self.dataArray.add(model)
        }
        self.tableView.reloadData()
    }
    
    func createUI() {
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "Edit", style: .plain, target: self, action: #selector(editBtnClicked))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "add_blue"), style: .plain, target: self, action: #selector(addBtnClicked))
        
        self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kWidth, height: kHeight), style: .plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        self.tableView.register(UINib.init(nibName: "SecondWeekThreeDemoCell", bundle: Bundle.main), forCellReuseIdentifier: "cell")
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.tableFooterView = UIView.init()
    }
    
    func addBtnClicked() {
        let vc = SecondWeekThreeDemoEdit.init(nibName: "SecondWeekThreeDemoEdit", bundle: Bundle.main)
        vc.title = "Add Todo"
        vc.editModel = { (model:SecondWeekThirdDemoModel) -> Void in
            print("闭包传值过来啦-增加")
            self.dataArray.add(model)
            self.tableView.reloadData()
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    // MARK: - 编辑
    func editBtnClicked() {
        self.tableView.isEditing = !self.tableView.isEditing
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SecondWeekThreeDemoCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SecondWeekThreeDemoCell
        let model = self.dataArray[indexPath.row] as! SecondWeekThirdDemoModel
        cell.titleLabel.text = model.titleStr
        cell.timeLabel.text = model.timeStr
        cell.cellImageView.image = UIImage.init(named: self.getCellImage(type: model.type))
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SecondWeekThreeDemoEdit.init(nibName: "SecondWeekThreeDemoEdit", bundle: Bundle.main)
        vc.title = "Edit Todo"
        let model = self.dataArray[indexPath.row] as! SecondWeekThirdDemoModel
        vc.model = model
        vc.editModel = { (model:SecondWeekThirdDemoModel) -> Void in
            print("闭包传值过来啦-编辑")
            self.dataArray.replaceObject(at: indexPath.row, with: model)
            self.tableView.reloadData()
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delteAction = UITableViewRowAction.init(style: .default, title: "Delete") { (action, index) in
            self.dataArray.removeObject(at: indexPath.row)
            self.tableView.reloadData()
        }
        
        return [delteAction]
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if sourceIndexPath != destinationIndexPath {
            //获取移动行对应的值
            let sourceModel = self.dataArray[sourceIndexPath.row] as! SecondWeekThirdDemoModel
            //删除移动的值
            self.dataArray.removeObject(at: sourceIndexPath.row)
            //如果移动区域大于现有行数，直接在最后添加移动的值
            if destinationIndexPath.row > self.dataArray.count {
                self.dataArray.add(sourceModel)
            }else {
                //没有超过最大行数，则在目标位置添加刚才删除的值
                self.dataArray.insert(sourceModel, at: destinationIndexPath.row)
            }
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func getCellImage(type: ListType) -> String {
        var str = ""
        switch type {
        case .ListTypePhone:
            str = "phone"
            break
        case .ListTypePeople:
            str = "people"
            break
        case .ListTypeShpping:
            str = "shoppingCart"
            break
        case .ListTypeAirplane:
            str = "airplane"
            break
        }
        return str
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
