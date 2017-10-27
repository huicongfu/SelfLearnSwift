//
//  SecondWeekFourthlyDemo.swift
//  SwiftSelfStudy
//
//  Created by hunuo on 2017/10/27.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
