//
//  ViewController.swift
//  斐波拉切
//
//  Created by 江连松 on 2017/4/26.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        for index in 0...50 {
//            print(Date().timeIntervalSince1970)
//            print("FlyELephant-第\(index)项的值:\(fibonacci1(index))")
//        }
        
//        for index in 0...50 {
//            print(Date().timeIntervalSince1970)
//            print("FlyELephant-第\(index)项的值:\(fibonacci2(index))")
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //递归算法
    func fibonacci1(_ n:NSInteger) -> NSInteger{
        if n<=0 {
            return 0
        }
        if n==1 || n==2 {
            return 1
        }
        return fibonacci1(n-1)+fibonacci1(n-2)
    }
    
    //循环算法
    func fibonacci2(_ n:Int) -> Int {
        if n <= 0 {
            return 0
        }
        
        if n == 1 {
            return 1
        }
        
        var firstNum:Int = 0
        var secondNum:Int = 1
        var result:Int = 0
        for _ in 2...n {
            result = secondNum + firstNum
            firstNum = secondNum
            secondNum = result
        }
        return result
    }
    
    func fabonacci3(_ n:Int) -> Int {
    
//        (1/√5)*{[(1+√5)/2]^n - [(1-√5)/2]^n}
        return 1.00/sqrt(5)*
    }
}

