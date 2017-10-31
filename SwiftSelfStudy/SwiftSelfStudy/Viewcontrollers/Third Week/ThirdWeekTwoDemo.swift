//
//  ThirdWeekTwoDemo.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/10/31.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class ThirdWeekTwoDemo: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var collectionView:UICollectionView?
    var dataArray = ["1","2","3","4","5","6","7","8","1","2","1","2","3","4","5","6","7","8","1","2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createUI()
    }
    
    func createUI() {
        
        let flowLayout = UICollectionViewFlowLayout.init()
        let cellW = (kWidth-31) / CGFloat(2.0)
        flowLayout.itemSize = CGSize.init(width: cellW, height: cellW)
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        self.collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: kWidth, height:kHeight), collectionViewLayout: flowLayout)
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.isPagingEnabled = true;
        self.view.addSubview(self.collectionView!)
        self.collectionView?.backgroundColor = UIColor.white
        
        self.collectionView?.register(UINib.init(nibName: "ThirdWeekTwoDemoCell", bundle: Bundle.main), forCellWithReuseIdentifier: "cell")
       
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ThirdWeekTwoDemoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ThirdWeekTwoDemoCell
        cell.cellImageView.image = UIImage.init(named: self.dataArray[indexPath.row])
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
