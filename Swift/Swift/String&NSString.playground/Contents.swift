//: Playground - noun: a place where people can play

import UIKit


// String  NSString
// Array   NSArray NSMutableArray
// Dictionary NSDictionary NSMutableDictionary
// Set     NSSet 
// Tuples
// Enum
// Struct


// 1.string 与 NSString 的相互转换
var string = NSString(format: "%d.apple", 5) as String
type(of: string)

var nsstring = NSString()
type(of: nsstring)

// 2.区别
string.isEmpty


// 3.增
string + "++"
string

string.append("+++==")
string

string.append("jiang")
string


var dic = ["a":"vale"]
dic.updateValue("ad", forKey: "fdf")

// 插入
// 插入到最开始
var newString = "123插入🚗"
newString.insert("1", at: newString.startIndex)
newString.insert("0", at: newString.endIndex)


// 指定插入
newString.insert("🌺", at: newString.index(newString.startIndex, offsetBy: 2))
newString

// 查询字符后，插入
let index = newString.firstIndex(of: "🌺")
type(of: index)
newString.insert("$", at: newString.index(index!, offsetBy: 1))


// 删
let testString = string.remove(at: string.startIndex)


// 替换
string.replacingOccurrences(of: "+++", with: "")
string


// Range




// 值类型， 引用类型
let string1 = "🚗"
let string2 = string1

string1
string2.lowercased()



let name = "jiangliansong"
name.substring(to: name.index(name.startIndex, offsetBy: 3))

(name as NSString).substring(to: 3)

name.substring(from: name.index(after: name.index(name.startIndex, offsetBy: 0)))
(name as NSString).substring(from: 13)

var a = name.prefix(1)


var newName = "jiangliansong".map{String($0) + "-"}.reduce("", +);
var namre = "jiangliansong".filter{$0 == "a"}
namre.count

func numJeweInStone(_ J: String, _ S: String) -> Int {
    return J.map { (i : Character) -> Int in
        let a = S.filter{$0 == i}
        print("===\(a)")
        return a.count
    }.reduce(0, +);
}
var count = numJeweInStone("aA", "aAAbbbb");
