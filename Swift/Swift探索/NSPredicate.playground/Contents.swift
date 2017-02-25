//: Playground - noun: a place where people can play

import UIKit

class Student: NSObject {
    
    var age: Int
    var name: String
    
    init(age:Int, name:String) {
        self.age = age
        self.name = name
    }
    
    override var description: String {
        return "name:\(self.name) age:\(self.age)"
    }
}

var students = NSMutableArray()
students.add(Student(age:18, name:"jiang"))
students.add(Student(age:19, name:"lian"))
students.add(Student(age:20, name:"song"))

//1.基本比较
//
//比较符号，都是针对于左边表达式和右边表达式
//1. > 大于
//2. > =大于等于
//3. < 小于
//4. <=小于等于
//5. ==等于
//6. != 或者<> 不等于
//7. BETWEEN 介于两者之间,包括上下限

// 1.2.3.4 结果都是一样；5是区间
let predicateByAge1 = NSPredicate(format: "age == 19")
let predicateByAge2 = NSPredicate(format: "age == %@", NSNumber(value: 19))
let predicateByAge3 = NSPredicate(format: "%K == %@", "age",NSNumber(value: 19))
let predicateByAge4 = NSPredicate(format: "age == $age")
let predicateByAge5 = NSPredicate(format: "age BETWEEN {%@,%@}",NSNumber(value: 19),NSNumber(value: 20))

let result1 = students.filtered(using:predicateByAge1)
let result2 = students.filtered(using:predicateByAge2)
let result3 = students.filtered(using:predicateByAge3)
let result4 = students.filtered(using:predicateByAge4.withSubstitutionVariables(["age":19]))
let result5 = students.filtered(using: predicateByAge5)


//2.字符串比较
//
//BEGINSWITH 左边表达式以右边表达式开头
//CONTAINS 左边表达式包含右边表达式
//ENDSWITH 左边表达式以右边表达式结尾
//LIKE 左边表达式和右边表达式相似（简单的正则表达式匹配，?匹配一个字符，*匹配0个或者多个字符）
//MATCHES 可以实现较为复杂的曾则表达式匹配
//用方括号加cd来不区分大小写和变音符号
//IN 左边的表达式在右边的集合里

let predicateByName1 = NSPredicate(format: "name BEGINSWITH %@", "jia")
let predicateByName2 = NSPredicate(format: "name CONTAINS %@ && age > 18", "i")
let predicateByName3 = NSPredicate(format: "name MATCHES 'j[a-z]*g'")
let predicateByName4 = NSPredicate(format: "name IN {'jiang','lian'}")

let result6 = students.filtered(using: predicateByName1)
let reuslt7 = students.filtered(using: predicateByName2)
let result8 = students.filtered(using: predicateByName3)
let result9 = students.filtered(using: predicateByName4)



//3.基于Block的谓词
//
//注意：基于Blcok的谓词不能用在CoreData的数据过滤上。基于Block能够灵活的定制谓词。
let predicateBlock = NSPredicate { (obj, _: [String : Any]?) -> Bool in
    var result = false
    if let student = obj as? Student {
        if student.age > 19 {
            return true
        }
    }
    return result
}
let result10 = students.filtered(using: predicateBlock)

