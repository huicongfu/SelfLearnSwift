//
//  ThirdWeekThreeDemo.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/11/1.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class ThirdWeekThreeDemo: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,ThirdWeekWaterFallLayoutDataSource {
    
    var collectionView:UICollectionView?
    var dataArray:NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
        self.downloadData()
    }
    
    func downloadData() {
        let array = ["3_1","3_2","3_3","3_4","3_5","3_1","3_2","3_3","3_4","3_5","3_3","3_4","3_5","3_1","3_2"]
        self.dataArray = NSMutableArray.init()
        for index in 0..<array.count {
            let model = ThirdWeekThreeDemoModel.init()
            let height:CGFloat = CGFloat(arc4random_uniform(300) + 100)
            model.headImage = array[index]
            model.imageHeight = height
            model.isSelected = false
            self.dataArray?.add(model)
        }
        self.collectionView?.reloadData()
    }
    
    func createUI() {
        
        let flowLayout = ThirdWeekThreeWaterFallLayout.init()
        flowLayout.dataSource = self as ThirdWeekWaterFallLayoutDataSource
        flowLayout.minimumLineSpacing = 2;
        flowLayout.minimumInteritemSpacing = 2
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 2, 2, 2)
        self.collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: kWidth, height:kHeight), collectionViewLayout: flowLayout)
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.view.addSubview(self.collectionView!)
        self.collectionView?.backgroundColor = UIColor.white
        
        self.collectionView?.register(UINib.init(nibName: "ThirdWeekThreeDemoCell", bundle: Bundle.main), forCellWithReuseIdentifier: "cell")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ThirdWeekThreeDemoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ThirdWeekThreeDemoCell
        let model:ThirdWeekThreeDemoModel = self.dataArray?[indexPath.row] as! ThirdWeekThreeDemoModel
        cell.cellImageView.image = UIImage.init(named: model.headImage)
        cell.loveBtn.tag = 500 + indexPath.row
        cell.loveBtn.addTarget(self, action: #selector(loveBtnClicked(btn:)), for: .touchUpInside)
        cell.loveBtn.isSelected = model.isSelected
        return cell
    }
    
    func numberOfCols(_waterFallLayout: ThirdWeekThreeWaterFallLayout) -> Int {
        return 2
    }
    
    func itemHeight(_waterFallLayout: ThirdWeekThreeWaterFallLayout, item: Int) -> CGFloat {
        let model:ThirdWeekThreeDemoModel = self.dataArray?[item] as! ThirdWeekThreeDemoModel
        return model.imageHeight
    }
    
    func loveBtnClicked(btn:UIButton) {
        let row = btn.tag - 500;
        
        btn.isSelected = !btn.isSelected
        let model:ThirdWeekThreeDemoModel = self.dataArray?[row] as! ThirdWeekThreeDemoModel
        model.isSelected = btn.isSelected
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
