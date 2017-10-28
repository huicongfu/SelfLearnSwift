//
//  SecondWeekThreeDemoCell.swift
//  SwiftSelfStudy
//
//  Created by hunuo on 2017/10/28.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class SecondWeekThreeDemoCell: UITableViewCell {

    @IBOutlet var cellImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellImageView.layer.cornerRadius = 25.0
        cellImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
