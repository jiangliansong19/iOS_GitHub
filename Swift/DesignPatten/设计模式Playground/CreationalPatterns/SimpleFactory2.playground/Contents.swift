//: Playground - noun: a place where people can play

import UIKit

enum CarBrand {
    case BMW
    case Ford
    case Volvo
    case UnKnown
}

//有时候，为了简化简单工厂模式，我们可以将抽象产品类和工厂类合并，将静态工厂方法移至抽象产品类中
class Car {
    var price: Double = 0
    
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

class BMWCar: Car {
    override init() {
        super.init()
        self.price = 350000
    }
}

class FordCar: Car {
    override init() {
        super.init()
        self.price = 250000
    }
}

class VolvoCar: Car {
    override init() {
        super.init()
        self.price = 150000
    }
}

class UnKnownCar: Car {
    override init() {
        super.init()
        self.price = 0
    }
}

var car = Car.createCar(.BMW)
print(String(describing:type(of: car)) + " price is \(car.price)")
