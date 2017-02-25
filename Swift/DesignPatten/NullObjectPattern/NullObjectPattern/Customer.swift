//
//  Customer.swift
//  NullObjectPattern
//
//  Created by JLS on 2017/2/23.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

protocol AbstractCustomer {
    var name: String {set get}
}


class RealCustomer: AbstractCustomer {
    
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
}


class NullCustomer: AbstractCustomer {

    var name: String {
        get {
            return "没有这个人"
        }
        set {}
    }
    
}
