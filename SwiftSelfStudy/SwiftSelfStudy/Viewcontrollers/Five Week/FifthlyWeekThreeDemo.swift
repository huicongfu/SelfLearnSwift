//
//  FifthlyWeekThreeDemo.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/11/17.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class FifthlyWeekThreeDemo: UIViewController,AVPlayerViewControllerDelegate {
    
    fileprivate lazy var player:AVPlayer? = {
        guard let path = Bundle.main.path(forResource: "login-bg-video", ofType: "mp4") else {
            return nil
        }
        
        let url = URL.init(fileURLWithPath: path)
        let temp = AVPlayer.init(url: url)
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.createUI()
    }
    
    func createUI() {
        self.view.backgroundColor = UIColor.white
        
        NotificationCenter.default.addObserver(self, selector: #selector(playFinish), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
        
        let avplayer = AVPlayerViewController.init()
        avplayer.player = player
        avplayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        avplayer.showsPlaybackControls = false
        avplayer.view.frame = view.bounds
        avplayer.delegate = self
        
        view.insertSubview(avplayer.view, at: 0)
        self.addChildViewController(avplayer)
        avplayer.player?.play()
    }
    
    func playFinish(notification:NSNotification) {
        let playerItem = notification.object as? AVPlayerItem
        playerItem?.seek(to: kCMTimeZero, completionHandler: { (bool) in
            
        })
        player?.play()
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
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
