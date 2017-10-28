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
    var dataArray:NSMutableArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.createUI()
    }
    
    func createUI() {
        self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kWidth, height: kHeight), style: .plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        self.tableView.register(UINib.init(nibName: "SecondWeekThreeDemoCell", bundle: Bundle.main), forCellReuseIdentifier: "cell")
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.tableFooterView = UIView.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
        
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
