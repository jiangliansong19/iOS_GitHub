//
//  ViewController.swift
//  BridgePattern
//
//  Created by JLS on 2017/2/18.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit


/*
 
 桥接（Bridge）是用于把抽象化与实现化解耦，使得二者可以独立变化。
 这种类型的设计模式属于结构型模式，它通过提供抽象化和实现化之间的桥接结构，来实现二者的解耦。
 
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //例子一：**车在**路上行驶
        let speedWay = SpeedWay()
        speedWay.vehicle = Car()
        speedWay.run()
        
        let street = Street()
        street.vehicle = Bus()
        street.run()
        
        //例子二：**人使用**电脑做**
        let student = Student()
        student.computer = Desktop()
        student.something = Shopping()
        student.people()
        
        let teacher = Teacher()
        teacher.computer = Laptop()
        teacher.something = Game()
        teacher.people()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

