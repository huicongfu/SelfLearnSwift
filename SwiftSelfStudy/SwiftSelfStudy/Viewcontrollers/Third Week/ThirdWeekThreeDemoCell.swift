//
//  ThirdWeekThreeDemoCell.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/11/1.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class ThirdWeekThreeDemoCell: UICollectionViewCell {

    @IBOutlet var cellImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellImageView.layer.cornerRadius = 5.0
        cellImageView.clipsToBounds = true
    }

}
