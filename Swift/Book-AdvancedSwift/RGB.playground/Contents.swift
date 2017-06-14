//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

// 例子
var sumUsingClosure: (Int, Int) -> (Int) = { $0 + $1 }
var sum = sumUsingClosure(5, 6)




// 定义RGB
var RGB:(CGFloat,CGFloat,CGFloat) -> (UIColor) = {
    
    UIColor(red: $0/255.0, green: $1/255.0, blue: $2/255.0, alpha: 1.0)
    
}

RGB(227, 122, 32)



