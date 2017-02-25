//: Playground - noun: a place where people can play

import UIKit

class Person: NSObject {
    
    var name: String {
        get {
            
            return "jiang"
        }
        set {
            print("name = \(newValue)")
        }
    }
    
    var age: Int {
        get {
            print("\(name):\(18)")
            return 18
        }
    }
}


let obj = Person()
obj.name
obj.age