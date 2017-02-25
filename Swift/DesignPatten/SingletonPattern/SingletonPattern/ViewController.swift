//
//  ViewController.swift
//  SingletonPattern
//
//  Created by JLS on 16/10/8.
//  Copyright © 2016年 JLS. All rights reserved.
//

import UIKit

/*
 1、单例类只能有一个实例。
 2、单例类必须自己创建自己的唯一实例。
 3、单例类必须给所有其他对象提供这一实例。
 4、注意同步锁synchronized和dispatch_onceToken的使用
*/

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().async {
            let model = SingletonA.shared
            for i in 1...10 {
                print("i------\(model.count)")
                sleep(1)
                model.count = i
            }
        }

        DispatchQueue.global().async {
            let model = SingletonA.shared
            for j in 11...20 {
                print("j------\(model.count)")
                sleep(1)
                model.count = j
            }
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

