//
//  ViewController.swift
//  NullObjectPattern
//
//  Created by JLS on 2017/2/23.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

/*
 
在空对象模式（Null Object Pattern）中，一个空对象取代 NULL 对象实例的检查。
Null 对象不是检查空值，而是反应一个不做任何动作的关系。
这样的 Null 对象也可以在数据不可用的时候提供默认的行为。
 
*/


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let customer1 = CustomerFactory().getCustomer("lucy")
        print(customer1.name)
        
        let customer2 = CustomerFactory().getCustomer("lili")
        print(customer2.name)
        
        let customer3 = CustomerFactory().getCustomer("jack")
        print(customer3.name)
        
        let customer4 = CustomerFactory().getCustomer("brown")
        print(customer4.name)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

