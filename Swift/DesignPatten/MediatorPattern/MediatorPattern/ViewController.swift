//
//  ViewController.swift
//  MediatorPattern
//
//  Created by JLS on 2017/2/22.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //1.聊天室内有多个用户，互相聊天。聊天室是中介者，联系了多个不同的用户！
        let user1 = User("刘天际")
        let user2 = User("迪无边")
        let user3 = User("姜丝")
        
        user1.send("我是liu")
        user2.send("我是di")
        user3.send("我是jiang")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

