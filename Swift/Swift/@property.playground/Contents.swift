//: Playground - noun: a place where people can play

import UIKit


// 1.作用域

let galaxy = "Milky Way"

class Person: NSObject {
    
    var name: String?
    internal var country: String?
    
    private var age: Int?
    // 2.只读
    private(set) var gender: String?
    
    // 3.设置默认值
    var province: String = "Guangdong"
    
    // 4.类似KVO，但是只能监测自身属性变量的变化
    var company: String? {
        
        didSet {
            print("change")
        }
        
    }
    
}

let model = Person()
model.province
model.company = "Poly"
