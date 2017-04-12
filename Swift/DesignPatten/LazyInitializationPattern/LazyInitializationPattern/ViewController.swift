//
//  ViewController.swift
//  LazyInitializationPattern
//
//  Created by 江连松 on 2017/4/12.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //懒加载
    private lazy var myLabel: UILabel? = {
        let label = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 30))
        label.backgroundColor = UIColor.red
        label.text = "jiangliansong"
        label.textColor = UIColor.white
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addSubview(myLabel!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

