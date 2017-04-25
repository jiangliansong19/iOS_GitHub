//: Playground - noun: a place where people can play

import UIKit


// MARK: - 内部实现过程
extension Array {
    
    func myReduce<U>(initial:U, combine:(Element,U)->U) -> U {
        
        var result = initial
        for x in self {
            result = combine(x,result)
        }
        return result
    }
}

// 数组元素相加
[1,2,3,4,5,6,7,8,9].reduce(0, +)

// 集合相加
(1...1024).reduce(0, +)

[1,2,3,4,5].myReduce(initial: 1, combine: *)

let num = [1,2,3,4,5,6,7,8].reduce(0) { (result, obj) -> Int in
    return result + obj
}
num

let array = [[1,2,3],[4,5,6],[7,8,9]]
let result = array.reduce([], +)


