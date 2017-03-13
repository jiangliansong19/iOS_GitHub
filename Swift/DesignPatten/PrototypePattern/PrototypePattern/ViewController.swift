//
//  ViewController.swift
//  PrototypePattern
//
//  Created by JLS on 2017/3/13.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //未使用原型模式。如果创建对象需要许多耗时操作，直接for循环，会导致资源消耗较多
        let pet1 = Pet1("乌骓", 300, 4)
        let person1 = Person1("项羽", 100, 22, pet1)
        //复制10项
        var array1 = [Person1]()
        for _ in 0...9 {
            let per = Person1(person1.name, person1.weight, person1.age, Pet1(pet1.name, pet1.weight, pet1.age))
            array1.append(per)
            print("-----\(per)")
        }
        
        
        //使用原型模式
        let pet = Pet("赤兔", 300, 4)
        let person = Person("吕布", 100, 22, pet)
        var array = [Person]()
        for _ in 0...9 {
            let per = person.clone()
            array.append(per as! Person)
            print("=====\(per)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

