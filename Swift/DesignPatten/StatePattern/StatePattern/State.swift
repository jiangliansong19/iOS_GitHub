//
//  State.swift
//  StatePattern
//
//  Created by JLS on 2017/2/23.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

protocol State {
    
    func getColor() -> UIColor
    
    func handlePush(_ contenxt:Context)
    
    func handlePull(_ contenxt:Context)
    
}


//push：blue-->green-->black-->red
//pull：red-->black-->green-->blue

class BlueState: State {
    
    func handlePush(_ contenxt: Context) {
        print("变成绿色")
        contenxt.state = GreenState()
    }
    
    func handlePull(_ contenxt: Context) {
        print("变成红色")
        contenxt.state = RedState()
    }
    
    func getColor() -> UIColor {
        return UIColor.blue
    }
}

class GreenState: State {
    
    func handlePush(_ contenxt: Context) {
        print("变成黑色")
        contenxt.state = BlackState()
    }
    
    func handlePull(_ contenxt: Context) {
        print("变成蓝色")
        contenxt.state = BlueState()
    }
    
    func getColor() -> UIColor {
        return UIColor.green
    }
}

class BlackState: State {
    
    func handlePush(_ contenxt: Context) {
        print("变成红色")
        contenxt.state = RedState()
        
    }
    
    func handlePull(_ contenxt: Context) {
        print("变成绿色")
        contenxt.state = GreenState()
    }
    
    func getColor() -> UIColor {
        return UIColor.black
    }
}

class RedState: State {
    
    func handlePush(_ contenxt: Context) {
        print("变成蓝色")
        contenxt.state = BlueState()
        
    }
    
    func handlePull(_ contenxt: Context) {
        print("变成黑色")
        contenxt.state = BlackState()
    }
    
    func getColor() -> UIColor {
        return UIColor.red
    }
}
