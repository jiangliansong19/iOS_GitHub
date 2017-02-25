//: Playground - noun: a place where people can play

import UIKit

extension Dictionary {
    mutating func merge<S: Sequence>(other: S) where S.Iterator.Element == (Key,Value) { for (k, v) in other {
        self[k] = v }
    }
}

let dic1 = ["firstname":"jiang"] as Dictionary
var dic = ["name":"liansong","age":"18"] as Dictionary

dic.merge(other: dic1)