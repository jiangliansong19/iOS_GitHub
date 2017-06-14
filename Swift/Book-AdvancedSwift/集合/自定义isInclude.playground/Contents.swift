//: Playground - noun: a place where people can play

import UIKit


// 是否包含
extension Array {
    
    func isInclude(match:(Element)->Bool) -> Bool {
        
        for obj in self where match(obj) {
            return true
        }
        return false
    }
}
let bool = ["1","2","3"].isInclude{$0=="1"}

[1,2,3,4].contains(1)

["a","b"].contains("1")
