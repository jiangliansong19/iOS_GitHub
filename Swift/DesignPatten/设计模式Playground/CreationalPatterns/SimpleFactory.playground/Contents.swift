//: Playground - noun: a place where people can play

import UIKit

enum CarBrand {
    case BMW
    case Ford
    case Volvo
    case UnKnown
}

protocol Car {
    var price: Double {get}
}

class BMWCar: Car {
    var price: Double = 350000
}

class FordCar: Car {
    var price: Double = 290000
}

class VolvoCar: Car {
    var price: Double = 330000
}

class UnKnownCar: Car {
    var price: Double = 0
}

class CarFactory {
    
    static func createCar(_ carType: CarBrand)-> Car {
        switch carType {
        case .Volvo:
            return VolvoCar()
        case .Ford:
            return FordCar()
        case .BMW:
            return BMWCar()
        default:
            return UnKnownCar()
        }
    }
}

var car = CarFactory.createCar(.BMW)
print(String(describing:type(of: car)) + " price is \(car.price)")
