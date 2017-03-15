//
//  ViewController.swift
//  FlyweightPattern
//
//  Created by JLS on 2017/2/19.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

/*
 享元模式的经典使用：tableView的复用机制
 */



/*
 使用步骤：
 1.每次创建一个对象后，将对象放入对象池
 2.下次再需要创建该类的对象，先检查对象池
 3.如有对象可用，则用之；无对象可用，则创建一个新的。
 */



/*
 原型模式：创建型模式，复制当前的对象，以创建重复对象。关注的是创建过程，以最少的代价创建一个对象。
 享元模式：结构型模式，复用当前对象，以减少对象个数。关注的是共享，表面的多个对象，实际上是一个。
 单例模式：创建型模式，减少对象数到1个。某方面是享元模式的极致，只有一个对象。
 */


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let goods1 = GoodsFactory().getGoods(name: "iPhone7s")
        goods1.showGoodsPrice(key: "32g")
        
        let goods2 = GoodsFactory().getGoods(name: "iPhone7s")
        goods2.showGoodsPrice(key: "128g")
        
        let goods3 = GoodsFactory().getGoods(name: "iPhone7s")
        goods3.showGoodsPrice(key: "64g")
        
        let goods4 = GoodsFactory().getGoods(name: "iPhone7s")
        goods4.showGoodsPrice(key: "128g")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

