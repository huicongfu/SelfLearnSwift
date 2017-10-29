//
//  SecondWeekThirdDemoModel.swift
//  SwiftSelfStudy
//
//  Created by hunuo on 2017/10/28.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

enum ListType:Int {
    case ListTypePeople = 0
    case ListTypePhone
    case ListTypeShpping
    case ListTypeAirplane
}

class SecondWeekThirdDemoModel: NSObject {
    var titleStr = ""
    var timeStr = ""
    var type = ListType.ListTypePeople
    
    
}
