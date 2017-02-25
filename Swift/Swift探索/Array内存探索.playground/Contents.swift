//: Playground - noun: a place where people can play

import UIKit

class Person: NSObject {
    
    var name: String = ""
    var age: Int = 0
    
    init(_ name:String, _ age:Int) {
        self.name = name
        self.age = age
    }
    
    override init() {
        super.init()
    }
}


struct Car {
    
    var price: Double
    var name: String
}

let person0 = Person("jiang", 18)
let person1 = Person("lian",19)
let person2 = Person("song",20)

// MARK: - 数组深复制，数组值类型的特点
//简简单单的一个“=”,两个数组内存，完全不一样了
var array = [person0,person1,person2]
var array1 = array
array1.removeAll()
array1
array


// MARK: - 数组引用型元素内存相同，验证引用类型的特点
//取A数组的元素，插入B数组，这两个元素，内存地址相同
var array2 = [Person]()
array2.append(array.first!)
array2.first

//再次验证内存地址相同，随便修改之一，两个都会变化
var array3 = [Person]()
let obj3 = array.first!
obj3.name = "array3.jiang"
array3.append(obj3)
array3.first
array.first

//就算创建一个新的对象，也没什么用！地址依旧一样！
var array5 = [Person]()
var obj5 = Person()
obj5 = array.first!
array5.append(obj5)
array5.first

// MARK: - 数组值类型元素
let car1 = Car(price: 123000.0, name: "奔驰")
let car2 = Car(price: 1444000.0, name: "保时捷")
let car3 = Car(price: 2323000.0, name: "兰博基尼")

//内存地址不一样。。修改其中之一，另一个不会发生变化
var array6 = [car1,car2,car3]
var array7 = [Car]()
var obj6 = Car(price: 0000, name: "--")
    array6.first!
array7.append(obj6)

array7[0].name = "jiang"
array7.first




