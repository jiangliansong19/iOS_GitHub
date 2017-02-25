//
//  FactoryProducer.swift
//  AbstractFactoryPattern
//
//  Created by JLS on 16/9/29.
//  Copyright © 2016年 JLS. All rights reserved.
//

import UIKit


class FactoryProducer: NSObject {

    func getFactory(type:FactoryType) -> AbstractFactory {
        
        switch type {
        case .color:
            return ColorFactory()
        case .shape:
            return ShapeFactory()
            
        }
        
    }
    
}
