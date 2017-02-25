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
        }
    }
}



class Shape: UIView {
    
    override func draw(_ rect: CGRect) {
        
        print("I am a shape")
        
    }
}

class Circle: Shape {
    
    override func draw(_ rect: CGRect) {
        print("I am a Circle")
    }
}

class Square: Shape {
    
    override func draw(_ rect: CGRect) {
        print("I am a Square")
    }
    
}


class Triangle: Shape {
    
    override func draw(_ rect: CGRect) {
        print("I am a Triangle")
    }
    
}
