//: Playground - noun: a place where people can play

import UIKit

//函数可以“捕获”存在于它们作用范围之外的变量

func returnFunc() -> (Int) -> () {
    var counter = 0
    func innerFunc(i: Int) {
        counter += i
        print("running total is now \(counter)")
    }
    return innerFunc
    //一般来说，counter离开它的作用域之后，将会被摧毁
    //但是innerfunc使用了它，他将继续存在
}


let f = returnFunc()
f(3)
f(4)

let g = returnFunc()
g(2)
g(3)

//f函数和g函数各自拥有自己的counter，互不影响。
f(5)
g(1)