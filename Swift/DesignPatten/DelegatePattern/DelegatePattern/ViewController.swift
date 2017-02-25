//
//  ViewController.swift
//  DelegatePattern
//
//  Created by JLS on 2017/2/20.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HorseDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let subView = CustomView(frame: self.view.bounds)
        self.view.addSubview(subView)
        subView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func run(meter: NSInteger) {
        print("🐎跑了-----\(meter)m")
    }
}

