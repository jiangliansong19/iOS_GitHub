//: Playground - noun: a place where people can play

import UIKit

extension Array {
    
    func seperated(by:(Element)->String) -> [[Element]] {
        
        // 1.获取string 数组
        let strings = self.map{by($0)}
        
        // 2.string 数组去重
        let norepeatStrings = NSSet(array:strings).allObjects as! [String]
        
        // 3.string 数组排序
        let orderStrings = norepeatStrings.sorted(by: <)
        
        // 4.分组
        var results:[[Element]] = []
        orderStrings.forEach { (string) in
            results.append(self.filter{by($0)==string})
        }
        return results
    }
}

struct Student {
    var age: Int
    var name: String
    
    static func getDay(seconds:Double) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter.string(from: Date(timeIntervalSince1970: seconds))
    }
}

var students = [Student(age:1480054654, name:"jiang"),
                Student(age:1480024654, name:"jiang"),
                Student(age:1480124654, name:"jiang"),
                Student(age:1480134654, name:"liu"),
                Student(age:1480434654, name:"liu"),
                Student(age:1480434654, name:"li"),]

var names = students.seperated{Student.getDay(seconds: Double($0.age))}
print(names)




