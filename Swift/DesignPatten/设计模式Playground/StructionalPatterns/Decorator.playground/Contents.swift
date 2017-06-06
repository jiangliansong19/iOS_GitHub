//: Playground - noun: a place where people can play

import UIKit

class Person {
    var firstName: String = ""
    
    func run() {
        print("human can run")
    }
}

private let lastNameKey = "lastNameKey"
extension Person {
    var lastName: String {
        get {
            return objc_getAssociatedObject(self, lastNameKey) as? String ?? ""
        }set {
            objc_setAssociatedObject(self, lastNameKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func eat() {
        print("human need eating")
    }
}

var obj = Person()
obj.firstName = "习"
obj.lastName = "大大"
obj.run()
obj.eat()
