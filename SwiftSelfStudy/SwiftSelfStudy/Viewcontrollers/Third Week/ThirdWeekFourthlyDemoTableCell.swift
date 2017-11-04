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
        selectedBGView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 4, height: self.frame.size.height))
        selectedBGView.backgroundColor = .red
        self.selectedBackgroundView = UIView.init(frame: CGRect.init(x: 5, y: 0, width: self.frame.size.width-5, height: self.frame.size.height))
        self.selectedBackgroundView?.addSubview(selectedBGView)
        self.selectedBackgroundView?.backgroundColor = UIColor.lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
