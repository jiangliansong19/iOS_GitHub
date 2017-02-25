//
//  Employee.swift
//  CompositePattern
//
//  Created by JLS on 2017/2/20.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class Employee: NSObject {

    var name = ""
    var dept = ""
    var salary = ""
    var subordinates = [Employee]()

    init(_ name:String, _ dept:String, _ salary:String) {
        self.name = name
        self.dept = dept
        self.salary = salary
    }

    func printEmployees() {
        
        print("name:\(name)   dept:\(dept)   salary:\(salary)")
        
        for obj in self.subordinates {
            obj.printEmployees()
        }
    }
}
