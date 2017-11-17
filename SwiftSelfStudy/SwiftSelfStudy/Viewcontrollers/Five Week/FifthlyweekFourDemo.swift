//
//  FifthlyweekFourDemo.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/11/17.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class FifthlyweekFourDemo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        createUI()
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

extension FifthlyweekFourDemo {
    fileprivate func createUI() {
        view.backgroundColor = UIColor.black
        
        let margin:CGFloat = 100
        let loadingV = LoadingView.init(frame: CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: kWidth-100, height: kHeight-margin)), colors: [#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1),#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1),#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)])
        loadingV.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 0)
        loadingV.center = view.center
        view.addSubview(loadingV)
        
    }
}
