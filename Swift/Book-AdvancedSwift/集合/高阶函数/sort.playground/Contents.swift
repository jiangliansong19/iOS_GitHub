//: Playground - noun: a place where people can play

import UIKit

struct model {
    var ID = 0
}
let array = [7,2,4,3,5,1,6].map{model(ID: $0)}
array

// sort排序
let sortedArray = array.sorted{$0.ID < $1.ID}
sortedArray

// <  >  排序
[2,1,4,8,7].sorted(by: <)

let students =
[["name":"jiangliansong","age":17],
 ["name":"jiangliansong","age":16],
 ["name":"jiangliansong","age":18],
 ["name":"jiangliansong","age":11]]
















