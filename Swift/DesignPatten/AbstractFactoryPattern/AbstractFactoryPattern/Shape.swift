//
//  Shape.swift
//  AbstractFactoryPattern
//
//  Created by JLS on 16/9/30.
//  Copyright © 2016年 JLS. All rights reserved.
//

import UIKit

class Shape: NSObject {

    func draw() {
        
    }
    
}


class Circle: Shape {
    
    override func draw() {
        print("I am circle")
    }
    
}

class Square: Shape {
    
    override func draw() {
        print("I am square")
    }
    
}

class Rectangle: Shape {
    
    override func draw() {
        print("I am rectangle")
    }
    
}
