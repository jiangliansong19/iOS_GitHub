//: Playground - noun: a place where people can play

import UIKit

var dic = ["keys":false, "name":"jiang"] as [String : Any]

//改变某个值
dic["keys"] = true
dic.updateValue("jiangliansong", forKey: "name")
dic

//增加某个键值对
dic["new"] = false
dic.updateValue(18, forKey: "age")
dic



var mutableDic = NSMutableDictionary(object: "jiang", forKey: "man" as NSCopying)


struct Student {
    
    var age: Int
    var name: String
    init(_ age:Int ,_ name:String) {
        self.age = age
        self.name = name
    }
}

var structDic = ["first":Student(18,"jiang"),"second":Student(19,"lian")]
let first = structDic["first"]