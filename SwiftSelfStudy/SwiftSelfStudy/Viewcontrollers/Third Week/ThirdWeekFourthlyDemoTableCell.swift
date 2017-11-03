//
//  ThirdWeekFourthlyDemoTableCell.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/11/3.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class ThirdWeekFourthlyDemoTableCell: UITableViewCell {

    @IBOutlet var cellTitleLabel: UILabel!
    @IBOutlet var selectedBGView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
