//
//  Color.swift
//  AbstractFactoryPattern
//
//  Created by JLS on 16/9/30.
//  Copyright © 2016年 JLS. All rights reserved.
//

import UIKit

class Color: NSObject {

    func fill() {
        
    }
    
}




class Blue: Color {
    
    override func fill() {
        
        print("fill with blue")
        
    }
    
}

class Red: Color {
    
    override func fill() {
        
        print("fill with red")
        
    }
    
}

class Yellow: Color {
    
    override func fill() {
        
        print("fill with yellow")
        
    }
    
}
