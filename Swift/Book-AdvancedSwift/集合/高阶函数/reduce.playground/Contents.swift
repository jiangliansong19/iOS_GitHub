//: Playground - noun: a place where people can play

import UIKit

//===========================================================
// 数组元素相加
[1,2,3,4,5,6,7,8,9].reduce(0, +)
// 集合相加
(1...1024).reduce(0, +)

let num = [1,2,3,4,5,6,7,8].reduce(0) { (result, obj) -> Int in
    return result + obj
}

//数组相加
let array = [[1,2,3],[4,5,6],[7,8,9]]
let result = array.reduce([], +)


//===========================================================
// 2.探索内部实现过程
extension Array {
    func myReduce<U>(initial:U, combine:(Element,U)->U) -> U {
        var result = initial
        for x in self {
            result = combine(x,result)
        }
        return result
    }
}
[1,2,3,4,5].myReduce(initial: 1, combine: *)


//===========================================================
//3.累加自定义对象的某个属性
struct Person {
    var name = ""
    var money = 0.0
}
let persons = (1...1000).map{Person(name:"jiang",money:Double($0*100))}
let totalMoney = persons.reduce(0) { (result, obj) -> Double in
    return result + obj.money
}
