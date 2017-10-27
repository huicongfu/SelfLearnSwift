//
//  SecondWeekTwoDemo.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/10/26.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class SecondWeekTwoDemo: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var collectionView:UICollectionView?
    var dataArray = NSMutableArray.init()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.init(colorLiteralRed: 208/255.0, green: 147/255.0, blue: 170/255.0, alpha: 1.0)
        
        self.createUI()
    }
    
    func createUI() {
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize.init(width: kWidth-30-30, height: kHeight/1.8)
        flowLayout.minimumInteritemSpacing = 15
        flowLayout.minimumLineSpacing = 15
        flowLayout.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15)
        self.collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: kWidth, height: kHeight-80), collectionViewLayout: flowLayout)
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.view.addSubview(self.collectionView!)
        
        self.collectionView?.register(UINib.init(nibName: "SecondWeekTwoDemoCell", bundle: Bundle.main), forCellWithReuseIdentifier: "cell")
        self.collectionView?.backgroundColor = UIColor.clear
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:SecondWeekTwoDemoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SecondWeekTwoDemoCell
        var image = UIImage.init(named: "201.jpg")
        
        if indexPath.row % 2 == 0 {
           image = UIImage.init(named: "201.jpg")
        }else {
            image = UIImage.init(named: "202.jpg")
        }
        cell.imageView.image = image
        cell.titleLabel.text = String.init(format: "Hell there,i miss u. %d", indexPath.row)
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
