//
//  ThirdWeekFourthlyDemo.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/11/3.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class ThirdWeekFourthlyDemo: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var tableView:UITableView?
    var dataArr = ["龙虾","蟹类","贝类","其它活鲜","冻品"]
    var selectedLeftIndex:NSInteger = 0
    var collectionView:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.createUI()
    }
    
    func createUI() {
        self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: 99, height: kHeight), style: .plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.register(UINib.init(nibName: "ThirdWeekFourthlyDemoTableCell", bundle: Bundle.main), forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView!)
        
        let lineView = UIView.init(frame: CGRect.init(x: 99, y: 0, width: 1, height: kHeight))
        lineView.backgroundColor = UIColor.black
        self.view.addSubview(lineView)
        
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        flowLayout.headerReferenceSize = CGSize.init(width: kWidth, height: 30)
        let wi = (kWidth-100-30)/2.0
        flowLayout.itemSize = CGSize.init(width:wi , height: wi*1.5)
        self.collectionView = UICollectionView.init(frame: CGRect.init(x: 100, y: 64, width: kWidth-100, height: kHeight-64), collectionViewLayout: flowLayout)
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.backgroundColor = UIColor.white
        self.view.addSubview(self.collectionView!)
        self.collectionView?.register(UINib.init(nibName: "ThirdWeekFourthlyDemoCell", bundle: Bundle.main), forCellWithReuseIdentifier: "cell1")
    }
    
    //MARK: - collectionView delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ThirdWeekFourthlyDemoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! ThirdWeekFourthlyDemoCell
        cell.cellTitleLabel.text = "加拿大龙虾-\(indexPath.row)"
        
        return cell
    }
    
    
    
    //MARK: - tableview delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ThirdWeekFourthlyDemoTableCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ThirdWeekFourthlyDemoTableCell
        cell.cellTitleLabel.text = self.dataArr[indexPath.row]
        
//        cell.selectedBackgroundView = UIView.init(frame: CGRect.init(x: 5, y: 0, width: cell.frame.size.width-5, height: cell.frame.size.height))
//        cell.selectedBackgroundView?.backgroundColor = UIColor.yellow
        if indexPath.row == selectedLeftIndex {
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
            cell.selectedBGView.isHidden = false
        }
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
