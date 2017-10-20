//
//  FirstWeekThreeDemo.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/10/20.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class FirstWeekThreeDemo: UIViewController {

    @IBOutlet var timesLabel: UILabel!
    var times:Float = 0.0;
    
    var timer:DispatchSourceTimer?
    
    var secondTimer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func starBtnClicked(_ sender: UIButton) {
//        timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
//        timer?.scheduleRepeating(deadline: .now(), interval: .milliseconds(100))
//        timer?.setEventHandler {
//            DispatchQueue.main.async {
//                self.timesLabel.text = String.init(format: "%.1f", arguments: [self.times])
//                self.times += 0.1
//            }
//        }
//        timer?.resume()
        
        if secondTimer === nil {
            secondTimer = Timer.init(timeInterval: 0.1, target: self, selector: #selector(addTime), userInfo: nil, repeats: true)
            RunLoop.main.add(secondTimer!, forMode: .commonModes)
        }else {
            secondTimer?.fireDate = NSDate.init() as Date //暂停之后重新开始
        }

    }
    
    func addTime() {
        self.timesLabel.text = String.init(format: "%.1f", arguments: [self.times])
        self.times += 0.1
    }
    
    @IBAction func pasueBtnClicked(_ sender: UIButton) {
//        self.timer?.suspend()
        secondTimer?.fireDate = Date.distantFuture//暂停
    }
    @IBAction func resetBtnClicked(_ sender: UIButton) {
//        self.timer?.cancel();
        
        self.secondTimer?.invalidate()
        self.secondTimer = nil
        self.times = 0.0;
        self.timesLabel.text = "0.0"
        
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
