//
//  ViewController.swift
//  ServerTest
//
//  Created by 江连松 on 2017/10/8.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "http://localhost:8080/TomcatTest/getNews?page=0")
        do {
            let jsonStr = try String.init(contentsOf: url!)
            print(jsonStr)
        }catch {
            print("error")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

