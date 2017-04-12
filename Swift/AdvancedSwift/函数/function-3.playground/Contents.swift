//: Playground - noun: a place where people can play

import UIKit

//函数可以使用{}来声明为闭包表达式


//func 声明的函数
func doubler(i: Int) -> Int { return i * 2 }
let a = [1,2,4,5].map(doubler)
//{} 声明的函数
let doublerr = {(i: Int) -> Int in return i * 2}
let b = [2,3,4,5].map(doublerr)

//简化过程
[2,3,4,5].map({(i: Int) -> Int in return i * 2})
[2,3,4,5].map({i in return i * 2})
[2,3,4,5].map({i in i * 2})
[2,3,4,5].map({$0 * 2})
[2,3,4,5].map() {$0 * 2}
[2,3,4,5].map{$0 * 2}

//无法省略参数，但是又不太关心参数是什么
(0...100).map{_ in arc4random()}