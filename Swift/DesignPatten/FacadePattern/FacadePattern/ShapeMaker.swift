//
//  ShapeMaker.swift
//  FacadePattern
//
//  Created by 江连松 on 2017/2/17.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class ShapeMaker: NSObject {

    class func drawCircle() {
        Circle().draw()
    }
    
    class func drawRectanle() {
        Rectangle().draw()
    }
    
    class func drawTrianle() {
        Triangle().draw()
    }
    
}
