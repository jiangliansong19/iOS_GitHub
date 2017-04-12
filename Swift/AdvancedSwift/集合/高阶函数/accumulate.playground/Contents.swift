//: Playground - noun: a place where people can play

import UIKit

// 与reduce相同，只不过accumulate 保留了每一步的步骤

let array1 = ["1","2","3","4","5","6"].reduce("", +)


extension Array {
    
    func accumulate<U>(initial:U, combine:@escaping (U,Element)->U) -> [U] {
        
        var result = initial
        
        return self.map({ element in
            result = combine(result,element)
            return result
        })
    }
}

[1,2,3,4,5,6].accumulate(initial: 1, combine: +)
