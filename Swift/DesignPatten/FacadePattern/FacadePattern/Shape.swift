//
//  Shape.swift
//  FacadePattern
//
//  Created by 江连松 on 2017/2/17.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class Shape: NSObject {
    func draw() {
        
        //此处各种复杂逻辑，算法等等。。。。
        print("draw shape")
    }
}


class Circle: Shape {
    override func draw() {
        print("draw circle")
    }
    
}


class Rectangle: Shape {
    override func draw() {
        print("draw rectangle")
    }
}


class Triangle: Shape {
    override func draw() {
        print("draw triangle")
    }
}
