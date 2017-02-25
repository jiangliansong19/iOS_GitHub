//
//  Item.swift
//  BuilderPattern
//
//  Created by 江连松 on 2017/2/17.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

@objc protocol Item {
    @objc optional func name() -> String
    @objc optional func price() -> Double
    @objc optional func packing() -> Packing
}


class Burger: Item {
    
    func packing() -> Packing {
        return Wrapper()
    }
    
    func name() -> String {
        return NSStringFromClass(type(of: self)) as String
    }
}

class ColdDrink: Item {
    
    func packing() -> Packing {
        return Bottol()
    }
    
    func name() -> String {
        return NSStringFromClass(type(of: self)) as String
    }
}



/// MARK: - 具体类

class VerBurger: Burger {
    
    func price() -> Double {
        return 10.0
    }
}

class ChickenBurger: Burger {
    
    func price() -> Double {
        return 15.0
    }
}

class Coke: ColdDrink {
    
    func price() -> Double {
        return 3.0
    }
}

class Pepsi: ColdDrink {
    
    func price() -> Double {
        return 5.0
    }
}
