//
//  FilterChain.swift
//  FilterPattern
//
//  Created by JLS on 2017/3/14.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class FilterChain: NSObject {
    
    private var message = ""
    private var filters = [Filter]()
    
    public init(_ msg: String) {
        self.message = msg
    }
    
    func addFilters(_ filter: Filter) {
        filters.append(filter)
    }
    
    //注意需要重写next方法。。此处next方法略！
    func doFilters() -> String {
        for obj in filters {
            message = obj.filter(message)
        }
        return message
    }
}

