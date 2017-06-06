//: Playground - noun: a place where people can play

import UIKit

class Singleton {
    
    private init() {} // 隐藏init方法
    static var shared = Singleton() //对象唯一。内部已经加过互斥锁和oncetoken
    
    var count = 0
}

class Test {
    
    func test() {
        DispatchQueue.global().async {
            for _ in 0...5 {
                Singleton.shared.count += 1
                print("counti = \(Singleton.shared.count)")
            }
        }
        
        DispatchQueue.global().async {
            for _ in 100...105 {
                Singleton.shared.count += 1
                print("countj = \(Singleton.shared.count)")
            }
        }
    }
}


Test().test()
