//
//  ShapeFactory.swift
//  AbstractFactoryPattern
//
//  Created by JLS on 16/9/30.
//  Copyright © 2016年 JLS. All rights reserved.
//

import UIKit

enum ShapeType {
    
    case circel
    case square
    case rectangle
    
}

class ShapeFactory: AbstractFactory {

    override func getShape(type:ShapeType) -> Shape {
        
        switch type {
        case .circel:
            return Circle()
        case .square:
            return Square()
        case .rectangle:
            return Rectangle()
        }
        
    }
}
