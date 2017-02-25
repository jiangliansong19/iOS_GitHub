//
//  ViewController.swift
//  ObserverPattern
//
//  Created by JLS on 2017/2/17.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

/*
 观察者两种实现方式：
 1.发通知
 2.KVO
 3.didSet(swift)
 */

let Notification_myNotice = "Notification_myNotice"

class ViewController: UIViewController {

    var count = 0
    @IBOutlet var numLabel: UILabel!
    
    var name: String! {
        didSet {
            print("================\(name)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(forName: Notification.Name.init(Notification_myNotice), object: nil, queue: nil) { (notice) in
            print("收到通知 myNotice")
        };
        
        self.addObserver(self, forKeyPath: "count", options: [.new,.old], context: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func stepAction(_ sender: UIStepper) {
        
        count += 1
        numLabel.text = String(count)
        self.setValue(count, forKey: "count")
        
        name = "jiang" + String(count)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "count" {
            let value = self.value(forKey: "count")
            print("============\(value)")
        }
    }
}

