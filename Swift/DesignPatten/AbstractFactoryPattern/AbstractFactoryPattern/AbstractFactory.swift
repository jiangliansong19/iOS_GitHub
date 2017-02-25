//
//  AbstractFactory.swift
//  AbstractFactoryPattern
//
//  Created by JLS on 16/9/30.
//  Copyright © 2016年 JLS. All rights reserved.
//

import UIKit

enum FactoryType {
    
    case shape
    case color
    
}

class AbstractFactory: NSObject {
    func getShape(type:ShapeType) -> Shape {
        return Shape()
    }
    func getColor(type:ColorType) -> Color {
        return Color()
    }
}


@objc protocol CounterDataSource {
    @objc optional func incrementForCount(count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}
