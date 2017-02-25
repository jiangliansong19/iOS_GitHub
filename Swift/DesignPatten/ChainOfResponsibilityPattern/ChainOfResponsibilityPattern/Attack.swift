//
//  Attack.swift
//  ChainOfResponsibilityPattern
//
//  Created by JLS on 2017/2/21.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit


enum AttackType {
    case fire //火系攻击魔法
    case water //水系攻击魔法
    case solid //土系攻击魔法
    case light //光系攻击魔法
}


class Attack: NSObject {
    
    var name: String = ""
    var damage: Int = 0
    var type: AttackType!
    
    init(_ name:String, _ damage:Int, _ type: AttackType) {
        self.name = name
        self.damage = damage
        self.type = type
    }
}
