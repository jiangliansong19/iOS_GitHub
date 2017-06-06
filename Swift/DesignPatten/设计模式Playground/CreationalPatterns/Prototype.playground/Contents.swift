//: Playground - noun: a place where people can play

import UIKit

//初始化某个对象，耗费较大。则使用原型模式

enum Car {
    case volvo
    case ford
    case BMW
    case toyato
    
    var price: Double {
        switch self {
        case .volvo:
            return 330000
        case .ford:
            return 210000
        case .BMW:
            return 390000
        case .toyato:
            return 150000
        }
    }
}

class CarFactory {
    
    func createCars(_ brands: [Car]) {
        for obj in brands {
            
        }
    }
}