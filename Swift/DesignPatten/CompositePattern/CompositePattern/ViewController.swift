//
//  ViewController.swift
//  CompositePattern
//
//  Created by JLS on 2017/2/20.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let CEO = Employee("刘军", "CEO", "100000")
        let headSale = Employee("秦朝", "Head Sales", "30000")
        let headMarket = Employee("将军", "Head Market", "30000")
        CEO.subordinates.append(headSale)
        CEO.subordinates.append(headMarket)
        
        let sale1 = Employee("白石", "Sale", "10000")
        let sale2 = Employee("霍无敌", "Sale", "10000")
        let sale3 = Employee("姜忠", "Sale", "10000")
        headSale.subordinates.append(sale1)
        headSale.subordinates.append(sale2)
        headSale.subordinates.append(sale3)
        
        let market1 = Employee("魏子贤", "Market", "10000")
        let market2 = Employee("李杰克", "Market", "10000")
        let market3 = Employee("祝王朝", "Market", "10000")
        headMarket.subordinates.append(market1)
        headMarket.subordinates.append(market2)
        headMarket.subordinates.append(market3)
        
        
        print(CEO.printEmployees())
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

