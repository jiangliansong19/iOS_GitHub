//: Playground - noun: a place where people can play

import UIKit

enum Fruits: String {
    case Apple
    case Orange
    case Banana
    case Pineapple
}

// 1.支持多种类型 Int, Float, Bool, Sting, Tuples
func setName(name: Fruits) {
    switch name {
    case .Apple:
        print("apple")
    case .Orange:
        print("orange")
        fallthrough // 继续执行下一个case
    case .Banana:
        print("banana")
    case .Pineapple:
        print("pineapple")
    }
}
setName(.Apple)

// 2.fallthrough
setName(.Orange)

