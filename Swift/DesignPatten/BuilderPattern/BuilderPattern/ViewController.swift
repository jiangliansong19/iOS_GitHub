//
//  ViewController.swift
//  BuilderPattern
//
//  Created by 江连松 on 2017/2/17.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

/*
 建造者模式（Builder Pattern）使用多个简单的对象一步一步构建成一个复杂的对象。这种类型的设计模式属于创建型模式，它提供了一种创建对象的最佳方式
 
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

