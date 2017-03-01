//
//  ViewController.swift
//  factoryPattenDemo
//
//  Created by JLS on 16/9/23.
//  Copyright © 2016年 JLS. All rights reserved.
//

import UIKit

/*
 1.抽象工厂模式：红警中，基地车可以认为是一个抽象工厂(超级工厂)。它制造了战场工厂，飞机场，兵营等。
 2.简单工厂模式：战车工厂是一个简单工厂，可以制造不同的战车。你不需要知道某种战车是怎么制造的，只需要知道他叫什么名字，外观是什么样子。比如你点击火箭车，你就得到了一辆火箭车。然后你就能用战车的基本功能和火箭车的特殊功能。
 3.原型模式：当你制造第二辆火箭车时，第一辆火箭车，就是一个原型。之后的火箭车，都是复制之前的。
*/

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 工厂模式
        let shape = ShapeFactory.getShape(style: .circle)
        shape.draw(self.view.bounds)
        
        let rect = ShapeFactory.getShape(style: .rectangle)
        
        
        let obj = VehicleFactory().getObject(.car)
        obj.drive()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

