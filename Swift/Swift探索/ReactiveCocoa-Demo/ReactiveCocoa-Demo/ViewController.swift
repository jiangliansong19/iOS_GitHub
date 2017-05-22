//
//  ViewController.swift
//  ReactiveCocoa-Demo
//
//  Created by 江连松 on 2017/5/18.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit
import ReactiveCocoa
import Result
import ReactiveSwift


class ViewController: UIViewController {

    @IBOutlet weak var inputTF: UITextField!
    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loginButton.reactive.controlEvents(.touchUpInside).observeValues { (button) in
            print("loginButton did clicked")
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

