//
//  Stock.swift
//  CommandPattern
//
//  Created by JLS on 2017/2/22.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

// 仓库，命令的执行者
class Stock: NSObject {

    var name: String = "fruit"
    var quantity: Int = 100
    
    func buy() {
        print("Stock [name:\(name)  quantity:\(quantity)kg] bought")
    }
    
    func sell() {
        print("Stock [name:\(name)  quantity:\(quantity)kg] sold")
    }
}
