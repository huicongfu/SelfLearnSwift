//
//  ThirdWeekTwoDemoCell.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/10/31.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class ThirdWeekTwoDemoCell: UICollectionViewCell {

    @IBOutlet var cellImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellImageView.layer.cornerRadius = 5.0
        cellImageView.clipsToBounds = true
    }

}
