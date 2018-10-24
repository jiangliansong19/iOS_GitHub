//: Playground - noun: a place where people can play

import UIKit


let fibs = [0,1,1,2,3,5]
let slice = fibs[1...]//从第二个元素到最后
type(of: slice)


let newArr = Array(slice)
type(of: newArr)
