//: Playground - noun: a place where people can play

import UIKit

//移除最后一位
[1,2,3,4,5,6].dropFirst()

//移除开始的4位
[1,2,3,4,5,6].dropFirst(4)

//移除最后一位
[1,2,3,4,5,6].dropLast()

//移除最后两位
[1,2,3,4,5,6].dropLast(2)

//移除最后一位，返回被移除的元素
var array = [1,2,3,4,5,6]
array.popLast()

//新数组保留位数。从后往前计
[1,2,3,4,5,6].suffix(2)
[1,2,3,4,5,6].suffix(4)
[1,2,3,4,5,6].suffix(10)

[1,2,8,4,7,6].suffix(from: 2)
[1,2,8,4,7,6].suffix(from: 4)

//新数组保留位数。从前往后计
[1,2,3,4,5,6].prefix(2)
[1,2,3,4,5,6].prefix(4)

[1,1,1,4,5,6].prefix(upTo: 2)
[1,2,3,4,5,6].prefix(upTo: 4)

[1,2,3,4,5,6].prefix(through: 4)
[1,2,3,4,5,6].prefix(through: 2)


[1,2,8,4,7,6].first { (i) -> Bool in
    i == 4
}
[1,2,8,4,7,6].first{$0 == 7}