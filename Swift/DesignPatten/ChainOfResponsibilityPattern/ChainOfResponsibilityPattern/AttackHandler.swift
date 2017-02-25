//
//  AttackHandler.swift
//  ChainOfResponsibilityPattern
//
//  Created by JLS on 2017/2/21.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class AttackHandler: NSObject {

    var nextAttackHandler: AttackHandler?
    
    func handler(attack: Attack) {
        nextAttackHandler?.handler(attack: attack)
    }
}

class FireHandler: AttackHandler {
    
    override func handler(attack: Attack) {
        if attack.type == .fire {
            print("火系防具抵挡了火系魔法\n")
        }else {
            print("火系防具挡不住这个魔法")
            super.handler(attack: attack)
        }
    }
}

class WaterHandler: AttackHandler {
    
    override func handler(attack: Attack) {
        if attack.type == .water {
            print("水系防具抵挡了水系魔法\n")
        }else {
            print("水系防具挡不住这个魔法")
            super.handler(attack: attack)
        }
    }
}

class SolidHandler: AttackHandler {
    
    override func handler(attack: Attack) {
        if attack.type == .solid {
            print("土系防具抵挡了土系魔法\n")
        }else{
            print("土系防具挡不住这个魔法")
            super.handler(attack: attack)
        }
    }
}

class Avatar: AttackHandler {
    
    static var current = Avatar()
    var health: Int = 100
    
    
    private override init(){}
    
    override func handler(attack: Attack) {
        health = health - attack.damage
        print("我被攻击到了,掉了\(attack.damage)滴血\n")
    }
}
