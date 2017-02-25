//: Playground - noun: a place where people can play

import UIKit

// 只能找到匹配的第一个
extension Array {
    
    func findElement(match:(Element)->Bool) -> Element? {
        
        for obj in self where match(obj) {
            return obj
        }
        return nil
    }
}

let obj = [1,2,4,5,6,7,8].findElement { (index:Int) -> Bool in
    index%2 == 0
}
obj

let obj1 = [1,2,4,5,6,7,8].findElement{$0/4 == 1}
obj1
