//
//  SecondWeekOneDemoModel.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/10/25.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class SecondWeekOneDemoModel: NSObject {
    let headImage = ""
    let name = ""
    let mobile = ""
    let email = ""
    let notes = ""
    
    init(dict:[String:Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
