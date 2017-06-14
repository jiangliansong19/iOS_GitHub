//: Playground - noun: a place where people can play

import UIKit

// MARK: - 自定义模型的包涵
struct Student {
    var classId = 0
    var name = ""
}
let students = [Student(classId:1,name:"jiang"),
                Student(classId:2,name:"lian"),
                Student(classId:3,name:"song")]
let student = Student(classId: 123, name: "jiangliansong")
let bool = students.contains { (obj) -> Bool in
    obj.classId == student.classId
}
let bool1 = students.contains{$0.classId == student.classId}


let words = ["Swift","iOS","cocoa","OSX","tvOS","tvOS"]
let tweet = "This is an example tweet larking about Swift"
let valid = !words.filter{tweet.contains($0)}.isEmpty
valid

let valid1 = tweet.characters
        .split(separator: " ")//split将字符串拆分成数组
        .lazy
        .map(String.init)
        .contains(where: Set(words).contains)


let string = "1,2,3,4,5"
let array = string.components(separatedBy: ",")
let array1 = string.characters.split(separator: ",")


