//
//  FilterString.swift
//  FilterPattern
//
//  Created by JLS on 2017/3/14.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

// 未使用设计模式。过滤规则已经定死了，如果发生改动，需要直接改动过滤代码。
class NormalMsgHandler: NSObject {
    
    private var message = ""
    public init(_ msg: String) {
        self.message = msg
    }
    
    //过滤
    public func filter() -> String {
        
        //1.过滤政治人名
        message = message.replacingOccurrences(of: "习近平", with: "**")
        message = message.replacingOccurrences(of: "朴槿惠", with: "**")
        
        //2.过滤脏词骂人的话
        message = message.replacingOccurrences(of: "你妈", with: "**")
        
        //3.过滤敏感词
        message = message.replacingOccurrences(of: "中国共产党", with: "**")
        
        return message
    }
    
}
