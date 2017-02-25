//
//  ViewController.swift
//  ProtocolDemo
//
//  Created by 江连松 on 16/9/11.
//  Copyright © 2016年 JLS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BuyFruitsDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
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
        
        let VC = ViewControllerA()
        VC.delegate = self
        VC.closure = { (string) -> Void in
            print("buySomething---\(string)")
        }
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
    
    // 代理
    func buyFruit(_ price: Double) {
        
        print("fruitPrice---\(price)")
        
    }
}

