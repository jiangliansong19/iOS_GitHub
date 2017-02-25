//
//  ViewController.swift
//  StatePattern
//
//  Created by JLS on 2017/2/23.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

/*
1.使用状态模式前，客户端外界需要介入改变状态，而状态改变的实现是琐碎或复杂的。
2.使用状态模式后，客户端外界可以直接使用事件Event实现，根本不必关心该事件导致如何状态变化，这些是由状态机等内部实现。
3.这是一种Event-condition-State，状态模式封装了condition-State部分。
4.每个状态形成一个子类，每个状态只关心它的下一个可能状态，从而无形中形成了状态转换的规则。如果新的状态加入，只涉及它的前一个状态修改和定义。
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

