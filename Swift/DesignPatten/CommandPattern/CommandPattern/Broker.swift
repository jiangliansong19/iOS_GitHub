//
//  Broker.swift
//  CommandPattern
//
//  Created by JLS on 2017/2/22.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class Broker: NSObject {

    var array = [Order]()
    
    func take(_ order: Order) {
        array.append(order)
    }
    
    func placeOrders() {
        array.forEach { (order) in
            order.execute()
        }
        array.removeAll()
    }
}
