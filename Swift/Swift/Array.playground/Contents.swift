//: Playground - noun: a place where people can play

import UIKit

//1. Array  NSArray  NSMutableArray

var array : [String]?
array = nil
let i = array?.count
if array == nil {
    print("111")
}
if array?.count == 0 {
    print("1212")
}

if array?.isEmpty == true {
    print("3333")
}



// 2.创建
var intArray = [1,2,3,4]

var array1 = [String]()

var array2 = [Int](repeating: 9, count:3)

// 增
array1.append("1")
array1
array1.append("2")
array1
array1 + ["3"]
array1.insert("3", at: 1)
array1
array1 = array1 + ["4", "5"]

// 删
array1.remove(at: 1)
max(1, 1)
array1


// 改
array1[0] = "jiang"
array1


// 值类型

var firstArray = [1,2,3]
let secondArray = firstArray
//firstArray.append(4)
//
//firstArray
//secondArray

if firstArray == secondArray {
    print("YES")
}


//

var array3 = [[1,2,3],[4,5],[6]]
var obj3 = array3.first
obj3?.append(0)
array3

array3[0].append(-1)
array3
