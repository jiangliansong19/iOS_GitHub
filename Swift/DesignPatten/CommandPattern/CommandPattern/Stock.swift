//
//  Stock.swift
//  CommandPattern
//
//  Created by JLS on 2017/2/22.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class Stock: NSObject {

    var name: String = "fruit"
    var quantity: Int = 0
    
    func buy() {
        print("Stock [name:\(name)  quantity:\(quantity)] bought")
    }
    
    func sell() {
        print("Stock [name:\(name)  quantity:\(quantity)] sold")
    }
}
