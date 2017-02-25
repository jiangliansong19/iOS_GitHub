//: Playground - noun: a place where people can play

import UIKit

let string1 = "jiangliansong"
let string2 = "jiangliansong19"

let bool1 = (string1 == string2)



let array1 = [1,2,3,4,5]
let array2 = [2,2,3,4,5]
let array3 = [1,2,3,4,5]
let bool2 = (array1 == array2)
let bool3 = (array1 == array3)

let bool4 = array1.elementsEqual(array2)
let bool5 = array1.starts(with: array2)