//
//  ViewController.swift
//  DecoratorPattern
//
//  Created by JLS on 2017/2/16.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

/*
 装饰者模式iOS实现：
 1.分类
 2.代理委托
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

