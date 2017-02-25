//
//  ViewController.swift
//  AbstractFactoryPattern
//
//  Created by JLS on 16/9/29.
//  Copyright © 2016年 JLS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 创建工厂
        let factory = FactoryProducer().getFactory(type: FactoryType.color)
        
        // 工厂常见对象
        let color = factory.getColor(type: ColorType.red)
        
        // 对象执行方法
        color.fill()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

