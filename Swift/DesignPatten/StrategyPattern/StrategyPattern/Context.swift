//
//  Context.swift
//  StrategyPattern
//
//  Created by JLS on 2017/2/23.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class Context: NSObject {

    private var strategy: Strategy!
    
    init(_ strategy: Strategy) {
        self.strategy = strategy
    }
    
    func executeStrategy(_ num1:Int, _ num2:Int) -> Int {
        return strategy.doOpereation(num1, num2)
    }
    
}
