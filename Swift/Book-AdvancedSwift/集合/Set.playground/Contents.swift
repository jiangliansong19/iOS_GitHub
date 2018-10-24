//: Playground - noun: a place where people can play

import UIKit

//标准库中主要的三种集合类型：Array，Dictionary，Set

//Set是一组无序的元素，每个元素只会出现一次。可以看成只存储了key值的字典。

var origin: Set = [1,2,3,4,5,5,7]
var origin1: Set = [1,2,3,4,5,6]

//求两个Set之间的交集
origin.intersection(origin1)

//求两个Set之间的并集
origin.formUnion(origin1)

//求origin对origin1的补集
origin.subtract(origin1)


//数组元素简单去重
let array = [1,2,3,3,3]
let set = Set(array)
let result = Array(set)

