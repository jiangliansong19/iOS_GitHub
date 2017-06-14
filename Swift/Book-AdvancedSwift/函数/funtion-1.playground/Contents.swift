//: Playground - noun: a place where people can play

import UIKit

//函数可以像Int或者String赋值给变量。也可以作为另一个函数的输入参数，或者另一个函数的返回值。


func pringInt(i: Int) {
    print("you passed: \(i)")
}
//函数赋值给变量
let funVar = pringInt
funVar(3)
funVar(5)

//函数做参数
func useFunction(_ funParama: (Int) -> ()) {
    funParama(11)
}
useFunction(pringInt)
useFunction(funVar)

//函数做返回值
func returnFunc() -> (Int) -> String {
    func innerFunc(i: Int) -> String {
        return "you passed\(i) to the returned function"
    }
    return innerFunc
}
let myFunc = returnFunc()
myFunc(3)


