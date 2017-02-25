//
//  ViewController.swift
//  DecoratorPattern
//
//  Created by JLS on 2017/2/16.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

/*
 
 装饰器模式（Decorator Pattern）允许向一个现有的对象添加新的功能，同时又不改变其结构。
 这种类型的设计模式属于结构型模式，它是作为现有的类的一个包装。
 这种模式创建了一个装饰类，用来包装原有的类，并在保持类方法签名完整性的前提下，提供了额外的功能。
 
 
 装饰者模式iOS实现：1.分类, 2.代理委托
 */


/*
 装饰器模式：一件装备(+200血，+100蓝)，然后镶嵌了一颗宝石(+10攻击力)，变成了(+200血，+100蓝，+10攻击力）的装备。
 宝石和装备一起构成了新的类，装饰类。装备结构，属性均不变，但是新的装备提供了更多的属性。
 */

class ViewController: UIViewController, StudentDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //分类中的属性
        let student = Student()
        student.fatherName = "东"
        student.motherName = "方"
        print("student.fatherName-----\(student.fatherName)")
        print("student.motherName-----\(student.motherName)")
        
        //分类中的方法
        student.run(100)
    
        //代理中的方法
        student.delegate = self
        student.doSomething()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func doHomework(_ workName: String) {
        print("做家庭作业---\(workName)")
    }
    
    func eatFruit(_ fruitName: String) {
        print("吃水果---\(fruitName)")
    }
}

