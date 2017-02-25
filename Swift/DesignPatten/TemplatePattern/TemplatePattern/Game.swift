//
//  Game.swift
//  TemplatePattern
//
//  Created by JLS on 2017/2/19.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class Game {
    
    // 公开的方法
    func initialize(){}
    func startPlay(){}
    func endPlay(){}
    
    // 固定的流程 .....注意final修饰
    final func play() {
        self.initialize()
        self.startPlay()
        self.endPlay()
    }
}

class Football: Game {
    override func initialize() {
        print("准备踢球")
    }
    
    override func startPlay() {
        print("开始踢球")
    }
    
    override func endPlay() {
        print("停止踢球")
    }
}


class HouseWork: Game {
    override func initialize() {
        print("准备家务活")
    }
    
    override func startPlay() {
        print("开始家务活")
    }
    
    override func endPlay() {
        print("停止家务活")
    }
}
