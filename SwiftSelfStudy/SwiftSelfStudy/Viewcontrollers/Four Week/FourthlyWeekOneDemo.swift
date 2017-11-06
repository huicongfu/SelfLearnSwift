//
//  FourthlyWeekOneDemo.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/11/6.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class FourthlyWeekOneDemo: UIViewController {

    @IBOutlet var clockFace: UIImageView!
    @IBOutlet var hour: UIImageView!
    @IBOutlet var minute: UIImageView!
    @IBOutlet var second: UIImageView!
    var timer:Timer?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.createUI()
//        self.tick()
    }
    
    func createUI() {
        
        timer = Timer.init(timeInterval: 1.0, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .commonModes)
        self.second.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0.9)
        self.minute.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0.9)
        self.hour.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0.9)
    }
    
    func tick() {
        let calendar = NSCalendar.init(identifier: NSCalendar.Identifier.gregorian)
        let date:NSDate = NSDate()
        let components:NSDateComponents = calendar?.components([NSCalendar.Unit.hour,NSCalendar.Unit.minute,NSCalendar.Unit.second], from: date as Date) as! NSDateComponents
        
        let hoursAngle = Double(components.hour)/12.0*M_PI*2
        let minuteAngle = Double(components.minute)/60.0*M_PI*2
        let secondAngle = Double(components.second)/60.0*M_PI*2
        
        self.hour.transform = CGAffineTransform.init(rotationAngle: CGFloat(hoursAngle))
        self.minute.transform = CGAffineTransform.init(rotationAngle: CGFloat(minuteAngle))
        self.second.transform = CGAffineTransform.init(rotationAngle: CGFloat(secondAngle))
        
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
