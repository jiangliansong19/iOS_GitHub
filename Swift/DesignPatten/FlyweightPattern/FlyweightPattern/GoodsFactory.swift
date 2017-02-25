//
//  GoodsFactory.swift
//  FlyweightPattern
//
//  Created by JLS on 2017/2/19.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class GoodsFactory: NSObject {

    private static var pool = [String: Goods]()
    
    func getGoods(name: String) -> Goods  {
        
        if GoodsFactory.pool[name] == nil {
            let goods = Goods(name: name)
            print("创建了新商品---\(goods.name)")
            GoodsFactory.pool[name] = goods
            return goods
        }else {
            let goods = GoodsFactory.pool[name]!
            print("使用商品缓存---\(goods.name)")
            return goods
        }
    }
}
