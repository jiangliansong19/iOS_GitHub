//
//  ViewController.swift
//  CommandPattern
//
//  Created by JLS on 2017/2/22.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fruitStock = Stock()
        let buyStock = BuyStock(fruitStock)
        let sellStock = SellStock(fruitStock)
        
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

