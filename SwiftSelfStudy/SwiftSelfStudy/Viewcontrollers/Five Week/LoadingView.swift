//
//  LoadingView.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/11/17.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class LoadingView: UIView {

    var colors:[UIColor] = [#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1),#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1),#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)]
    var duration = 2.0
    var interval = 1.0
    
    fileprivate var lineLength:CGFloat!
    fileprivate var lineWidth:CGFloat!
    fileprivate var margin:CGFloat!
    fileprivate var lines:[CAShapeLayer] = []
    fileprivate let angle:CGFloat = -30
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupConfig()
    }
    
    init(frame: CGRect,colors:[UIColor]) {
        super.init(frame: frame)
        self.colors = colors
        setupConfig()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConfig()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

extension LoadingView {
    fileprivate func setupConfig() {
        
    }
}
