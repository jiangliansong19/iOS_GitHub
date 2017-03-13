//
//  Pet1&Person1.swift
//  PrototypePattern
//
//  Created by JLS on 2017/3/13.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit


//例子：一个人有一条狗


class Pet1: NSObject {
    
    var name = ""
    var weight = 0
    var age = 0
    
    init(_ name: String, _ weight: Int, _ age: Int) {
        self.name = name
        self.weight = weight
        self.age = age
    }
}


class Person1: NSObject {
    
    var name = ""
    var weight = 0
    var age = 0
    var pet: Pet1
    
    init(_ name: String, _ weight: Int, _ age: Int, _ pet: Pet1) {
        self.name = name
        self.weight = weight
        self.age = age
        self.pet = pet
    }
}
