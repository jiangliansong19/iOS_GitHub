//
//  Goods.swift
//  FlyweightPattern
//
//  Created by JLS on 2017/2/19.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

protocol IGoods {
    func showGoodsPrice(key: String)
}

class Goods:NSObject, IGoods {

    var price = 0.0
    var name = ""
    
    init(name: String) {
        self.name = name
    }
    
    func showGoodsPrice(key: String) {
        if key.lowercased() == "32g" {
            print("价格6199")
        }else if key.lowercased() == "64g" {
            print("价格6599")
        }else if key.lowercased() == "128g" {
            print("价格7399")
        }
    }
}
