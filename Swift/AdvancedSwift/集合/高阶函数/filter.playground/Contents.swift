//: Playground - noun: a place where people can play

import UIKit

let array = [1,2,3,4,5,6,7].filter{$0 % 2 == 0}
array

// 内部实现
extension Array {
    func myFilter(isInclude:(Element)->Bool) -> [Element] {
        var result:[Element] = []
        for obj in self {
            if isInclude(obj)  {
                result.append(obj)
            }
        }
        return result
    }
}
let testArray = [1,2,3,4,5,6,7,8].myFilter{$0%3 == 0}
testArray


// 检测字符串数组，有多少个元素包含 "Hello"
let greetings = ["Hello, World", "Hello, Swift", "Later, Objective-C"]
let count = greetings.map{ $0.contains("Hello") ? 1 : 0 }.reduce(0, +)
count
let count1 = greetings.reduce(0, {$0 + ($1.contains("Hello") ? 1 : 0)})
count1