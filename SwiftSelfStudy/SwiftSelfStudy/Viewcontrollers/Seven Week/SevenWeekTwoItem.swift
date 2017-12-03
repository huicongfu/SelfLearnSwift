//
//  SevenWeekTwoItem.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/12/3.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class SevenWeekTwoItem: NSObject {
    let count:Int
    
    init(number:Int) {
        count = number
    }
    
    static func creatItems(count:Int) -> [SevenWeekTwoItem] {
        var items = [SevenWeekTwoItem]()
        
        for index in 1...count {
            items.append(SevenWeekTwoItem.init(number: index))
        }
        return items
    }
    
    func imageUrl() -> URL? {
        return URL.init(string: "https://placeholdit.imgix.net/~text?txtsize=33&txt=image+\(count)&w=300&h=300")
    }
    
}
