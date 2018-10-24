//: Playground - noun: a place where people can play

import UIKit

let setting = ["name":"jiang","gender":"female"]
var result = setting.mapValues { item -> String in
    return item + "123"
}

