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
        navigationController?.delegate = self
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
//        UIView.transition(with: (self.navigationController?.view)!, duration: 1, options: .transitionCrossDissolve, animations: { 
//            self.navigationController?.pushViewController(vc, animated: false)
//        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationControllerOperation,
                              from fromVC: UIViewController, to toVC: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
            
            if operation == .push {
                return CustomPushAnimation() //push时,使用此动画
            }
            
            if operation == .pop {
                return CustomPopAnimation() //pop时,使用此动画
            }
            
            return nil
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

//MARK: Push 动画
class CustomPushAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        print("\(#function)")
        
        transitionContext.containerView.backgroundColor = UIColor.white // 修改过渡时的背景颜色
        
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        
        transitionContext.containerView.insertSubview(toViewController.view, aboveSubview: fromViewController.view)
        
        toViewController.view.transform = CGAffineTransform(translationX: kWidth, y: kHeight)
        //通过以下方式,可以组合2个动画效果
//      toViewController.view.transform = CGAffineTransform(translationX: -100, y: -100).concatenating(CGAffineTransform(scaleX: 2, y: 2))
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            
            toViewController.view.transform = CGAffineTransform.identity
            fromViewController.view.transform = CGAffineTransform(translationX: -kWidth, y: -kHeight)
        }) { (completion) in
            fromViewController.view.transform = CGAffineTransform.identity
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
}

//MARK: Pop动画
class CustomPopAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        transitionContext.containerView.backgroundColor = UIColor.white // 修改过渡时的背景颜色
        
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        
        transitionContext.containerView.insertSubview(toViewController.view, belowSubview: fromViewController.view)
        
        toViewController.view.transform = CGAffineTransform(translationX: -kWidth, y: -kHeight)
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            toViewController.view.transform = CGAffineTransform.identity
            fromViewController.view.transform = CGAffineTransform(translationX: kWidth, y: kHeight)
        }) { (completion) in
            fromViewController.view.transform = CGAffineTransform.identity
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
}

