//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class Person {
    var age: Int = 0
    var name: String = ""
}

class PersonModel {
    
    init(_ model: Person) {
        
    }
    
    var person: Person!
    var personDescription = ""
}