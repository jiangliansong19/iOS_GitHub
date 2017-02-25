//
//  ViewController.swift
//  StrategyPattern
//
//  Created by JLS on 2017/2/23.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let context1 = Context(AddStrategy())
        print("10 + 15 = \(context1.executeStrategy(10, 15))")
        
        let context2 = Context(MultiStrategy())
        print("10 * 12 = \(context2.executeStrategy(10, 12))")
        
        let context3 = Context(MinusStrategy())
        print("49 - 22 = \(context3.executeStrategy(49, 12))")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

