//
//  CustomerFactory.swift
//  NullObjectPattern
//
//  Created by JLS on 2017/2/23.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class CustomerFactory: NSObject {

    static let array = ["lucy","john","yohn","jack","stephem"]
    
    func getCustomer(_ name: String) -> AbstractCustomer {
        
        for obj in CustomerFactory.array where obj == name.lowercased() {
            return RealCustomer(name)
        }
        return NullCustomer()
    }
}
