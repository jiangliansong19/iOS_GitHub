//
//  ViewController.swift
//  ChainOfResponsibilityPattern
//
//  Created by JLS on 2017/2/20.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //1.创建一个游戏人物
        let avatar = Avatar.current
        
        //2.添加各种装备
        //处理顺序： 土系防具 水系防具 火系防具 玩家
        let fireArmedHandler = FireHandler()
        fireArmedHandler.nextAttackHandler = avatar
        
        let waterArmedHandler = WaterHandler()
        waterArmedHandler.nextAttackHandler = fireArmedHandler
        
        let solidArmedHandler = SolidHandler()
        solidArmedHandler.nextAttackHandler = waterArmedHandler
        
        
        //3.被攻击
        let waterAttack = Attack("暴浪", 2, .water)
        solidArmedHandler.handler(attack: waterAttack)
        
        let fireAttack = Attack("火滋", 3, .fire)
        solidArmedHandler.handler(attack: fireAttack)
        
        let solidAttack = Attack("地爆天星", 10, .solid)
        solidArmedHandler.handler(attack: solidAttack)
        
        let lightAttack = Attack("圣光裁决", 8, .light)
        solidArmedHandler.handler(attack: lightAttack)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

