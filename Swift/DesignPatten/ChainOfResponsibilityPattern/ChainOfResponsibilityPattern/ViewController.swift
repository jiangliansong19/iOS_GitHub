//
//  ViewController.swift
//  ChainOfResponsibilityPattern
//
//  Created by JLS on 2017/2/20.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

/*
 
 顾名思义，责任链模式（Chain of Responsibility Pattern）为请求创建了一个接收者对象的链。
 这种模式给予请求的类型，对请求的发送者和接收者进行解耦。
 这种类型的设计模式属于行为型模式。
 
 在这种模式中，通常每个接收者都包含对另一个接收者的引用。
 如果一个对象不能处理该请求，那么它会把相同的请求传给下一个接收者，依此类推。
 
 */



/*
 例一：
 责任链模式：游戏中，多件装备组成一条链。一个火球打过来，从第一个装备开始判断，如果抵抗火，则能处理该攻击。如果不能，则它会传递到第二件装备，与此类推。
 
 例二：
 责任链模式：一间店铺，员工可以0.8折，经理可以0.7，主管0.6，老板拥有的权限都不一样。一位顾客来买东西，他要打6折，首先员工处理，如果达不到要求，则是经理，经理达不到要求，则老板出马！
 */




class ViewController: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet var testButton: UIButton!
    @IBOutlet var bgView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(tapAction1))
        tap1.delegate = self
        self.view.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(tapAction2))
        tap2.delegate = self
        bgView.addGestureRecognizer(tap2)
        
        
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

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view == self.view {
            return false
        }
        return true
    }
    
    
    
    func tapAction1() {
        
        print("click on self.view")
    }

    func tapAction2() {
        
        print("click on bgview")
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        
        print("click on button")
    }

}

