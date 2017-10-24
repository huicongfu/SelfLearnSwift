//
//  FirstWeekFourthlyModel.swift
//  SwiftSelfStudy
//
//  Created by hunuo on 2017/10/24.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class FirstWeekFourthlyModel: NSObject {
    let name:String = ""
    let currentId:Int = 0
    let parentId:Int = 0
    var childData:NSArray?
    
    init(dict:[String:AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
