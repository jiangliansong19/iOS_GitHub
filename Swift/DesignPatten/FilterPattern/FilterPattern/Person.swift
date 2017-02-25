//
//  Person.swift
//  FilterPattern
//
//  Created by JLS on 2017/2/20.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class Person: NSObject {

    var name = ""
    var gender = ""
    var maritalStatus = ""
    
    init(_ name: String, _ gender: String, _ maritalStataus: String) {
        self.name = name
        self.gender = gender
        self.maritalStatus = maritalStataus
    }
    
}


