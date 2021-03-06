//
//  ThirdWeekOneDemo.swift
//  SwiftSelfStudy
//
//  Created by hunuo on 2017/10/31.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class ThirdWeekOneDemo: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var collectionView:UICollectionView?
    var dataArray = ["0","1","2","3","4","5","6","7","8","9","10"]
    var pageController = UIPageControl.init()
    var contentView = UIView.init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createUI()
    }
    
    func createUI() {
        

        self.view.addSubview(self.contentView)
        
        let flowLayout = ThirdWeekOneFlowLayout.init()
        
        let cellW = (kWidth-50) / CGFloat(kcellNumberOfOneRow)

        self.collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 100, width: kWidth, height:cellW*2+30), collectionViewLayout: flowLayout)
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.isPagingEnabled = true;
        self.view.addSubview(self.collectionView!)
        self.collectionView?.backgroundColor = UIColor.init(colorLiteralRed: 224/255.0, green: 250/255.0, blue: 229/255.0, alpha: 1.0)
        self.collectionView?.register(UINib.init(nibName: "ThirdWeekOneCell", bundle: Bundle.main), forCellWithReuseIdentifier: "cell")
//        self.collectionView?.contentInset = UIEdgeInsetsMake(0, 0, 0, kWidth/1.5)
        
        self.pageController.frame = CGRect.init(x: kWidth/2.0 - 50, y: (self.collectionView?.frame.origin.y)! + (self.collectionView?.frame.size.height)! + 10, width: 100, height: 20)
        self.pageController.numberOfPages = 2;
        self.pageController.currentPage = 0;
        self.pageController.currentPageIndicatorTintColor = UIColor.black
        self.pageController.pageIndicatorTintColor = UIColor.gray
        self.pageController.addTarget(self, action: #selector(valueChange), for: .valueChanged)
        self.view.addSubview(self.pageController)
    }
    
    func valueChange() {
//        let page:CGFloat = CGFloat(self.pageController.currentPage)
//        print(page)
//        self.collectionView?.setContentOffset(CGPoint.init(x: (kWidth * page), y: 10), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ThirdWeekOneCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ThirdWeekOneCell
        cell.cellTitleLabel.text = "\(self.dataArray[indexPath.row])"
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page:Int = Int(scrollView.contentOffset.x/kWidth)
        self.pageController.currentPage = page
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
