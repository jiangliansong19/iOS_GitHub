//
//  ShapeFactory.swift
//  factoryPattenDemo
//
//  Created by JLS on 16/9/23.
//  Copyright © 2016年 JLS. All rights reserved.
//

import UIKit

enum ShapeStyle {
    case circle
    case square
    case triangle
    case rectangle
}

class ShapeFactory: NSObject {

    class func getShape(style:ShapeStyle) -> Shape {
        
        switch style {
        case .circle:
            return Circle()
        case .square:
            return Square()
        case .triangle:
            return Triangle()
        case .rectangle:
            return Rectangle()
        }
    }
}

protocol Shape {
    func draw(_ rect: CGRect)
}


class Circle: Shape {
    
    func draw(_ rect: CGRect) {
        print("I am a Circle")
    }
}

class Square: Shape {
    
    func draw(_ rect: CGRect) {
        print("I am a Square")
    }
    
}


class Triangle: Shape {
    
    func draw(_ rect: CGRect) {
        print("I am a Triangle")
    }
    
}

class Rectangle: Shape {
    func draw(_ rect: CGRect) {
        print("I am a Rectangle")
    }
}
