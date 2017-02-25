//: Playground - noun: a place where people can play

import UIKit

let tuples0 = ("string",[1,2,3],["key",3])
tuples0.0
tuples0.1
tuples0.2

// 不带参数名
let tuples1 = ("Apple", 9.8)
tuples1.0
tuples1.1

// 带参数名
let tuples2 = (name:"Apple", price:9.8)
tuples2.0
tuples2.name
tuples2.1
tuples2.price

// 方法返回值为元组,为！
func getDetailInfo() -> (name:String, price:Float) {
    
    return (name:"Orange", price:6.8)
    
}

func getInfo() -> (name:String, price:Float)? {
    
    return nil
    
}

// 方法参数为元组
func getPlace(info: (name:String, price:Float)) -> String {
    
info.name
info.price
    
    return "SZ"
    
}




getPlace(info: ("apple",9.0))


// 值类型
var tuples3 = ("banana", 3.0)
var tuples4 = tuples3
tuples4.0 = "watermelon"
tuples4.1 = 2.6

tuples3
tuples4


let segueIdTuples = (waitSendOut:"searchWaitSendOutSegue",
                     sentOut:"searchSentOutSegue",
                     finished:"searchFinishedSegue",
                     seeLogistics:"searchSeeLogisticsSegue",
                     confirmeSendOut:"searchConfirmSendOutSegue")
segueIdTuples.waitSendOut


