//
//  SecondWeekOneDemoModel.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/10/25.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class SecondWeekOneDemoModel: NSObject {
    var headImage = ""
    var name = ""
    var mobile = ""
    var email = ""
    var notes = ""
    
    init(dict:[String:Any]) {
        super.init()
//        setValuesForKeys(dict)
        headImage = dict["headImage"] as! String
        name = dict["name"] as! String
        mobile = dict["mobile"] as! String
        email = dict["email"] as! String
        notes = dict["notes"] as! String
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
