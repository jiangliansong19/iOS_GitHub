//
//  ViewController.swift
//  CommandPattern
//
//  Created by JLS on 2017/2/22.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

/*
 命令模式（Command Pattern）是一种数据驱动的设计模式，它属于行为型模式。
 请求以命令的形式包裹在对象中，并传给调用对象。
 调用对象寻找可以处理该命令的合适的对象，并把该命令传给相应的对象，该对象执行命令。
 */


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fruitStock = Stock()
        
        //命令
        let buyStock = BuyStock(fruitStock)
        let sellStock = SellStock(fruitStock)
        
        //命令的调用者。接收命令，并寻找命令的执行对象，然后执行。
        let broker = Broker()
        broker.take(buyStock)
        broker.take(sellStock)
        broker.placeOrders()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

