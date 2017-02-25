//
//  BarracksFactory.swift
//  factoryPattenDemo
//
//  Created by JLS on 2017/2/24.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

enum VehicleType {
    case car
    case trunk
    case bus
}

class VehicleFactory: NSObject {

    var type: VehicleType!
    
    func getObject(_ type: VehicleType) -> Vehicle {
        switch type {
        case .car: return Car().create() 
        case .trunk: return Trunk().create() 
        case .bus: return Bus().create() 
        }
    }
}


protocol Vehicle {
    func create() -> Vehicle
    func drive()
}

class Car: Vehicle {
    internal func create() -> Vehicle {
        print("工厂制造--car")
        return Car()
    }
    
    func drive() {
        print("car开始行驶了")
    }
}

class Trunk: Vehicle {
    internal func create() -> Vehicle {
        print("工厂制造--trunk")
        return Trunk()
    }
    
    func drive() {
        print("trunk开始行驶了")
    }
}


class Bus: Vehicle {
    internal func create() -> Vehicle {
        print("工厂制造--bus")
        return Bus()
    }

    func drive() {
        print("bus开始行驶了")
    }
}
