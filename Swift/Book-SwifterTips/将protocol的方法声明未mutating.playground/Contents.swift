//: Playground - noun: a place where people can play

import UIKit


protocol Vehicle {
    
    var numberOfWheels: Int {get}
    var color: UIColor {get set}
    mutating func changeColor()

}


struct MyCar: Vehicle {

    let numberOfWheels = 4
    var color = UIColor.blue
    
    mutating func changeColor() {
        color = .red
    }
}

class YourCar: Vehicle {
    
    let numberOfWheels = 2
    var color = UIColor.black
    
    func changeColor() {
        color = .red
    }
}
