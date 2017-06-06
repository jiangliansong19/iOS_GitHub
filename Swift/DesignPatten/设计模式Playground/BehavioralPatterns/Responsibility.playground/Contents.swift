//: Playground - noun: a place where people can play

import UIKit

//1.单向链表包含数据域和指针域，责任链也包含两部分，本身方法和指向下一个对象的属性。当它本身能解决请求时，处理请求，责任链结束，如果不能处理，则调用下一环处理该请求。
//2.为请求创建的一个接收者的链，将请求部分与处理部分解耦。

enum AttackType {
    case fire
    case solid
    case water
    case thunder
}
protocol Attack {
    var type:AttackType{get}
    var name:String{get}
}
class FireAttack: Attack {
    var type: AttackType{return AttackType.fire}
    var name: String{return "火遁·豪火球"}
}
class WaterAttack: Attack {
    var type: AttackType{return AttackType.water}
    var name: String{return "水遁·水乱波"}
}
class SolidAttack: Attack {
    var type: AttackType {return AttackType.solid}
    var name: String {return "土遁·土石流"}
}
class ThunderAttack: Attack {
    var type: AttackType {return AttackType.thunder}
    var name: String{ return "雷遁·千鸟"}
}


class AttackHandler {
    var nextHandler: AttackHandler?
    func defensive(_ attack: Attack){}
}
class FireResistantEquipment: AttackHandler {
    override init() {
        super.init()
        self.nextHandler = WaterResistantEquipment()
    }
    override func defensive(_ attack: Attack) {
        if attack.type == .fire {
            print(String(describing:(type(of: self)))+"抵抗住了"+attack.name)
        }else {
            nextHandler?.defensive(attack)
        }
    }
}
class WaterResistantEquipment: AttackHandler {
    override init() {
        super.init()
        self.nextHandler = SolidResistantEquipment()
    }
    override func defensive(_ attack: Attack) {
        if attack.type == .water {
            print(String(describing:(type(of: self)))+"抵抗住了"+attack.name)
        }else {
            nextHandler?.defensive(attack)
        }
    }
}
class SolidResistantEquipment: AttackHandler {
    override init() {
        super.init()
        self.nextHandler = UnableResistantHandler()
    }
    override func defensive(_ attack: Attack) {
        if attack.type == .solid {
            print(String(describing:(type(of: self)))+"抵抗住了"+attack.name)
        }else {
            nextHandler?.defensive(attack)
        }
    }
}
class UnableResistantHandler: AttackHandler {
    override init() {
        super.init()
        self.nextHandler = nil
    }
    override func defensive(_ attack: Attack) {
        print("\(attack.name)，好厉害，我居然挡不住")
    }
}

let handler = FireResistantEquipment()
let fireAttack = FireAttack()
let waterAttack = WaterAttack()
let solidAttack = SolidAttack()
let thunderAttack = ThunderAttack()

handler.defensive(fireAttack)
handler.defensive(solidAttack)
handler.defensive(thunderAttack)
