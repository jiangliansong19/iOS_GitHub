//: Playground - noun: a place where people can play

import UIKit



// 字符串数组的indexOf，contain都是普通函数
let array = ["my","iOS","computer","is","very","fast"]
let arrayIndex = array.index(of: "is")
let bool1 = array.contains("very")
let bool2 = array.contains("as")


// 字符串的indexOf，contain
var string = "my 💻 is very 🔜"
let stringIndex = string.characters.index(of: "💻")
string.insert("🍎", at: stringIndex!)
let bool3 = string.characters.contains("🍎")


//======================================================
// 对象的indexOf，contain
struct Student {
    var age = 0
    var name = ""
}
let students = [1,2,3,4,5,6,7].map{Student.init(age: $0, name: "jiangliansong")}
students

let bool4 = students.contains{$0.age > 4}
bool4
let bool5 = students.contains { (obj: Student) -> Bool in
    return obj.name.characters.first == "h"
}
bool5
let index = students.index{$0.age == 3}
index
