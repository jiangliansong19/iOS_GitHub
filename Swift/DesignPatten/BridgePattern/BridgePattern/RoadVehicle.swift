//
//  RoadVehicle.swift
//  BridgePattern
//
//  Created by JLS on 2017/2/18.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit


//所有路的基类
protocol Road {
    var vehicle: Vehicle? {get set}
    func run()
}

//所有带轮子的车的基类
protocol Vehicle {
    func run()
}

//=============================================


class Street: Road {
    
    var vehicle: Vehicle?
    
    func run() {
        vehicle?.run()
        print("在市区街道上行驶")
    }
}

class SpeedWay: Road {
    
    var vehicle: Vehicle? = nil
    
    func run() {
        vehicle?.run()
        print("在高速公路上行驶")
    }
}


//=============================================


class Car: Vehicle {
    func run() {
        print("汽车")
    }
}

class Bus: Vehicle {
    func run() {
        print("公交车")
    }
}
