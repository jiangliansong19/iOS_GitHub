//: Playground - noun: a place where people can play

import UIKit

var dic = ["name":"dawang"]
dic.updateValue("China", forKey: "country")
dic["province"] = "HongKong"
dic

var dic1 = ["country":"American","provice":"New York"]
dic.merge(dic1) { (a, b) -> String in
    return a
}
dic.merge(dic1) { (a, b) -> String in
    return b
}

dic.merge(dic1, uniquingKeysWith: {$1})
