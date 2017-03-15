//
//  Protocol.swift
//  BridgePattern
//
//  Created by JLS on 2017/2/18.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit


//人的基类
protocol People {
    var computer: Computer? {set get}
    var something: Something? {set get}
    
    func people()
}


//电脑的基类
protocol Computer {
    func use()
}

//干活的基类
protocol Something {
    func doSomething()
}


//=============================================

class Student: People {
    var computer: Computer?
    var something: Something?

    func people() {
        print("学生")
        computer?.use()
        something?.doSomething()
    }
}

class Teacher: People {
    var computer: Computer?
    var something: Something?
    
    func people() {
        print("老师")
        computer?.use()
        something?.doSomething()
    }
}

//=============================================

class Desktop: Computer {
    func use() {
        print("使用台式机")
    }
}

class Laptop: Computer {
    func use() {
        print("使用笔记本")
    }
}

//=============================================

class Game: Something {
    func doSomething() {
        print("玩游戏")
    }
}

class Shopping: Something {
    func doSomething() {
        print("购物")
    }
}
