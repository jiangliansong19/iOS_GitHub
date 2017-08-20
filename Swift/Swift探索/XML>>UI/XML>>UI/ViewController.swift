//
//  ViewController.swift
//  XML>>UI
//
//  Created by 江连松 on 2017/6/18.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        
        try! FileGenerator.writeToFileWith("Person", content: "class Person {}", path: "/tmp/sj/")
        
        print(NSHomeDirectory())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

