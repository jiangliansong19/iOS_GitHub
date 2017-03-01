//
//  ViewController.swift
//  FacadePattern
//
//  Created by 江连松 on 2017/2/17.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

/*
外观模式（Facade Pattern）隐藏系统的复杂性，并向客户端提供了一个客户端可以访问系统的接口。
这种类型的设计模式属于结构型模式，它向现有的系统添加一个接口，来隐藏系统的复杂性。
 
使用场景：    1、为复杂的模块或子系统提供外界访问的模块。
            2、子系统相对独立。
            3、预防低水平人员带来的风险。
*/


/*
 例子一：
 外观模式：手机的CPU，电池，摄像头等等，都是一个个的科技黑盒。
 它们隐藏了其内部的复杂构造，只留给手机一个可以访问和使用的端口。
 
 例子二：
 iOS的lib文件，隐藏了实现过程和内部逻辑，只留给开发者一个访问的接口，开发者看不到，也不用管内部到底是什么。
 
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

