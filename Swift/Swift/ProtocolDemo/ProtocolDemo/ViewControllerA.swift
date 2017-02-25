//
//  ViewControllerA.swift
//  ProtocolDemo
//
//  Created by 江连松 on 16/9/11.
//  Copyright © 2016年 JLS. All rights reserved.
//

import UIKit

// 代理
protocol BuyFruitsDelegate {
    func buyFruit(_ price: Double)
}

typealias BuySomething = (String) -> Void

class ViewControllerA: UIViewController {

    var delegate: BuyFruitsDelegate?
    var closure: BuySomething?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        let button = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 50))
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.setTitle("Click", for: UIControlState())
        button.backgroundColor = UIColor.lightGray
        self.view.addSubview(button)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonAction() {
        
        // 可选链
        self.delegate?.buyFruit(Double(arc4random()).truncatingRemainder(dividingBy: 10.0))
        
        self.closure?("clothes")
        
    }
}
