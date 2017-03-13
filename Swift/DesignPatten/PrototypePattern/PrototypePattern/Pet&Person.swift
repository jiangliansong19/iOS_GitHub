//
//  Pet&Person.swift
//  PrototypePattern
//
//  Created by JLS on 2017/3/13.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

protocol CloneProtocol {
    func clone() -> CloneProtocol
}

class Pet:NSObject, CloneProtocol {
    internal func clone() -> CloneProtocol {
        return Pet(name, weight, age) as Pet
    }

    var name = ""
    var weight = 0
    var age = 0
    
    init(_ name: String, _ weight: Int, _ age: Int) {
        self.name = name
        self.weight = weight
        self.age = age
    }
}


class Person:NSObject, CloneProtocol {
    internal func clone() -> CloneProtocol {
        return Person(name, weight, age, pet) as Person
    }
    
    var name = ""
    var weight = 0
    var age = 0
    var pet: Pet
    
    init(_ name: String, _ weight: Int, _ age: Int, _ pet: Pet) {
        self.name = name
        self.weight = weight
        self.age = age
        self.pet = pet
    }
    
    
}
