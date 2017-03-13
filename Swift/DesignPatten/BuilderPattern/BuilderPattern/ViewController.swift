//
//  ViewController.swift
//  BuilderPattern
//
//  Created by 江连松 on 2017/2/17.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

/*
 建造者模式（Builder Pattern）使用多个简单的对象一步一步构建成一个复杂的对象。
 这种类型的设计模式属于创建型模式，它提供了一种创建对象的最佳方式。
 一个 Builder 类会一步一步构造最终的对象。该 Builder 类是独立于其他对象的。
 
 与工厂模式的区别是：建造者模式更加关注与零件装配的顺序。
 */


/*
 建造者模式：一部手机，很复杂，在某个工厂里直接制造很困难。
 1.分成了很多个零配件，分别在不同的工厂制造。
 2.每种零配件，都有很多种不同的品牌，规格等，可以任选。
 3.最后，按照组装工厂期望的方式组装。
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let vegMeal = MealBuilder().prepareVegMeal()
        print("\nvegMeal----\(vegMeal.getCost())")
        print("\nvegMeal----\(vegMeal.show(items: vegMeal.array))")
        
        let nonVegMeal = MealBuilder().prepareNonVegMeal()
        print("\nnonVegMeal----\(nonVegMeal.getCost())")
        print("\nnonVegMeal----\(nonVegMeal.show(items: vegMeal.array))")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

