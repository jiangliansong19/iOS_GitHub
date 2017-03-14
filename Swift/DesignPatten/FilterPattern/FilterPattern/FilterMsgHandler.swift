//
//  FilterMsgHandler.swift
//  FilterPattern
//
//  Created by JLS on 2017/3/14.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class FilterMsgHandler: NSObject {

    private var message = ""
    private var filters = [Filter]()
    
    public init(_ msg: String,_ filters: [Filter]) {
        self.message = msg
        self.filters = filters
    }
    
    func doFilters() -> String {
        for obj in filters {
            message = obj.filter(message)
        }
        return message
    }
}



protocol Filter {
    func filter(_ text: String) -> String
}

class PolicyNameFilter: Filter {
    internal func filter(_ text: String) -> String {
        return text.replacingOccurrences(of: "习近平", with: "**").replacingOccurrences(of: "朴槿惠", with: "**")
    }
}

class CurseWordFilter: Filter {
    internal func filter(_ text: String) -> String {
        return text.replacingOccurrences(of: "你妈", with: "**")
    }
}

class SenstiveFilter: Filter {
    internal func filter(_ text: String) -> String {
        return text.replacingOccurrences(of: "中国共产党", with: "**")
    }
}
