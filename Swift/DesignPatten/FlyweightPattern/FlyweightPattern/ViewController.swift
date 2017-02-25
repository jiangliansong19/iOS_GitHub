//
//  ViewController.swift
//  FlyweightPattern
//
//  Created by JLS on 2017/2/19.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

/*
 1.tableView的复用机制

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

