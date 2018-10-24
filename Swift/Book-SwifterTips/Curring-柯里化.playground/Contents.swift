//: Playground - noun: a place where people can play

import UIKit

//在计算机科学中，柯里化（英语：Currying），是把接受多个参数的函数变换成接受一个单一参数（最初函数的第一个参数）的函数，并且返回接受余下的参数而且返回结果的新函数的技术

//在直觉上，柯里化声称“如果你固定某些参数，你将得到接受余下参数的一个函数”。所以对于有两个变量的函数 y^x，如果固定了 y=2，则得到有一个变量的函数  2^x。


func addOne(num: Int) -> Int {
    return num + 1
}
func addTwo(num: Int) -> Int {
    return num + 2
}
func addThree(num: Int) -> Int {
    return num + 3
}

//如上，+1，+2，+3 的方法都相似。
func addTo(_ adder: Int) -> Int -> Int {
    return { num in
        num + adder
    }
}



class Computer {
    func square(_ x:Double) -> (Double) -> Double {
        return { num in
            num * num * x * x
        }
    }
}

let compute = Computer()
print(compute.square(2)(3))

let com = Computer.square(Computer())(2)(9)
print(com)






class BankAccount {
    var balance: Double = 0.0
    
    func deposit(_ amount: Double) {
        balance += amount
    }
}
let account = BankAccount()
account.deposit(200)
print(account.balance)

BankAccount.deposit(account)(120)
print(account.balance)
