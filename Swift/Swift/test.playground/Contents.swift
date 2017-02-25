//: Playground - noun: a place where people can play

import UIKit

var array = [1,1,1,1,2,2,2,4,4,4,4,4,4,5,6,66,7]


var result = [[Int]]()


result.append([array.first!])
array.removeFirst()

for intObj in array {
    
    let isContain = false
    for (index,arrayObj) in result.enumerated() {
        
        if arrayObj.first == intObj {
            var tempArray = arrayObj
            tempArray.append(intObj)
            result[index] = tempArray
        }
    }
}



// 

let tempArray = array
tempArray.filter{$0%2 == 0}
tempArray