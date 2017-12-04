//
//  SevenWeekTwoDemo.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/12/3.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SevenWeekTwoDemo: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    let imageLoadQueu = OperationQueue()
    var imageOps = [(SevenWeekTwoItem, Operation?)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = UIColor.white
       imageLoadQueu.maxConcurrentOperationCount = 2
        imageLoadQueu.qualityOfService = .userInitiated
        
        self.collectionView?.register(UINib.init(nibName: "CollectionCell", bundle: Bundle.main), forCellWithReuseIdentifier: reuseIdentifier)
//        使用map 函数进行改造，创建imageOps
        imageOps = SevenWeekTwoItem.creatItems(count: 100).map({ (images) -> (SevenWeekTwoItem, Operation?) in
            return (images, nil)
        })
        
        self.collectionView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imageOps.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionCell
        
        cell.imageView.image = nil
    
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = cell as! CollectionCell
        let (item, operation) = imageOps[indexPath.row]
        //        只是以防万一，我们先停止一下操作
        operation?.cancel()
        weak var weakCell = cell
        
        let newOp = ImageLoadOperation(forItem: item) { (image) in
            DispatchQueue.main.async {
                weakCell?.imageView.image = image
            }
        }
        
        imageLoadQueu.addOperation(newOp)
        imageOps[indexPath.row] = (item, newOp)
    }
    
    
    
    //    MARK: - UICollectionViewDelegateFlowLayout代理方法
    
    ///调整CollectionCell的大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = UIScreen.main.bounds.width * 0.5 - 5.0
        return CGSize(width: w, height: w)
    }

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
