//
//  ThirdWeekFifthDemo.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/11/4.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class ThirdWeekFifthDemo: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UINavigationControllerDelegate {
    var collectionView:UICollectionView?
    let array = ["3_5_1","3_5_2","3_5_3","3_5_4","3_5_5","3_5_6","3_5_2","3_5_3","3_5_4","3_5_5","3_5_3","3_5_4","3_5_5","3_5_1","3_5_2"]
    override func viewDidLoad() {
        super.viewDidLoad()

        self.createUI()
    }
    
    func createUI() {
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        let wi = (kWidth-20-10)/2.0
        flowLayout.itemSize = CGSize.init(width:wi , height: wi)
        self.collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: kWidth, height: kHeight), collectionViewLayout: flowLayout)
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.backgroundColor = UIColor.white
        self.view.addSubview(self.collectionView!)
        self.collectionView?.register(UINib.init(nibName: "ThirdWeekFifthDemoCell", bundle: Bundle.main), forCellWithReuseIdentifier: "cell1")
    }
    
    //MARK: - collectionView delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ThirdWeekFifthDemoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! ThirdWeekFifthDemoCell
        cell.cellImageView.image = UIImage.init(named: self.array[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ThirdWeekFifthDetailVC()
        vc.imageStr = self.array[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
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
