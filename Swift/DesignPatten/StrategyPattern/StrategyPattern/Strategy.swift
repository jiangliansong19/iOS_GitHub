//
//  Strategy.swift
//  StrategyPattern
//
//  Created by JLS on 2017/2/23.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

protocol Strategy {
    func doOpereation(_ num1:Int, _ num2:Int) -> Int
}


class AddStrategy: Strategy {
    
    func doOpereation(_ num1: Int, _ num2: Int) -> Int {
        return num1 + num2
    }
}

class MinusStrategy: Strategy {
    
    func doOpereation(_ num1: Int, _ num2: Int) -> Int {
        return num1 - num2
    }
}

class MultiStrategy: Strategy {
    
    func doOpereation(_ num1: Int, _ num2: Int) -> Int {
        return num1 * num2
    }
}
