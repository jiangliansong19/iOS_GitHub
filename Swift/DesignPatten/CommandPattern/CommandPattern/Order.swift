//
//  Order.swift
//  CommandPattern
//
//  Created by JLS on 2017/2/22.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

// 抽象命令类
protocol Order {
    func execute()
}


// 具体命令类
class BuyStock: Order {
    
    private var stock: Stock!
    
    init(_ stock: Stock) {
        self.stock = stock
    }
    
    func execute() {
        stock.buy()
    }
}

// 具体命令类
class SellStock: Order {
    
    private var stock: Stock!
    
    init(_ stock: Stock) {
        self.stock = stock
    }
    
    func execute() {
        stock.sell()
    }
}
