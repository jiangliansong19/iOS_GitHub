//
//  ColorFactory.swift
//  AbstractFactoryPattern
//
//  Created by JLS on 16/9/30.
//  Copyright © 2016年 JLS. All rights reserved.
//

import UIKit

enum ColorType {
    case blue
    case red
    case yellow
}

class ColorFactory: AbstractFactory {

    override func getColor(type:ColorType) -> Color {
        
        switch type {
        case .blue:
            return Blue()
        case .red:
            return Red()
        case .yellow:
            return Yellow()
        }
    }

}
