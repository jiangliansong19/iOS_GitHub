//: Playground - noun: a place where people can play

import UIKit

let count = 5
count.dynamicType

//let string = String(5)
//
//Int(string)


let float = Float(count)
float.dynamicType


let frame = CGRectMake(CGFloat(0)+40*CGFloat(4), 1, 1, 1)

dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.2)),
               dispatch_get_main_queue()) {
    
}
