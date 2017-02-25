//: Playground - noun: a place where people can play

import UIKit

// 1.@autoClosure,可以把一句表达式自动封装成闭包

func logIfTure(_ predicate: () -> Bool) {
    if predicate() {
        print("true")
    }
}
logIfTure { () -> Bool in
    return 3 > 2
}
logIfTure({return 3 > 2})
logIfTure({3 > 2})
logIfTure{3 > 2}

func logIfFalse(_ predicate: @autoclosure () -> Bool) {
    if predicate() {
        print("true")
    }
}
logIfFalse(3 > 2)
logIfFalse(false)


let startLevel = 1
var level: Int?
let myLevel1 = level ?? startLevel


//public func ??<T>(optional: T?, defaultValue: @autoclosure () throws -> T) rethrows -> T
//public func ??<T>(optional: T?, defaultValue: @autoclosure () throws -> T?) rethrows -> T?

