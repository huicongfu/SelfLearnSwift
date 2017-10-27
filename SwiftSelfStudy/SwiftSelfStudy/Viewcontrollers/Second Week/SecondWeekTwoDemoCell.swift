//
//  SecondWeekTwoDemoCell.swift
//  SwiftSelfStudy
//
//  Created by hunuo on 2017/10/27.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class SecondWeekTwoDemoCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 5.0
    }

}
