//
//  ViewController.swift
//  MediatorPattern
//
//  Created by JLS on 2017/2/22.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

/*
 中介者模式（Mediator Pattern）是用来降低多个对象和类之间的通信复杂性。
 这种模式提供了一个中介类，该类通常处理不同类之间的通信，并支持松耦合，使代码易于维护。
 中介者模式属于行为型模式。
 */


/*
 中介者模式，代理模式，桥接模式，命令模式：
 有买房，中介，卖房3方。
 1.中介是中介者，它负责买房方，卖房方的通信。
 2.对买房方而言，中介是他的代理，帮他买房。而对卖房方，中介也是他的代理，帮他卖房。
 3.中介也是一个桥接，他联系了买房方和卖房方。
 4.中介也是命令的调用者，他接受了买房方的命令，寻找卖房方。同时他又接受了卖房方的命令，寻找买主。
 
 区别：
 1.中介者模式联系的是多个对象，让他们可以互相通信。关注降低通信复杂度。
 2.代理模式中，被代理类可以使用代理类的功能，而代理类却无法访问被代理类。一般一对一。关注的是功能分离。
 3.桥接模式中，有一个抽象类拥有多个属性(每个属性都是一个新的抽象类，是一个新的维度)，多个抽象类的实现部分各不同。实现抽象和实现分离。
 4.命令模式中，每条命令都是一个对象，并请求者和实现者解耦。
 */



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //1.聊天室内有多个用户，互相聊天。聊天室是中介者，使多个用户通信简单化！
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

