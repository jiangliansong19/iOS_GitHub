//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for (index1, num1) in nums.enumerated() {
        for (index2, num2) in nums.enumerated() {
            if num1 + num2 == target && index1 < index2 {
                return [index1,index2]
            }
        }
    }
    return [NSNotFound,NSNotFound]
}

let array = twoSum((0...10000).map{$0*2}, 16021)
array