//: Playground - noun: a place where people can play

import UIKit

let array = [1,2,3,4,5,6]
type(of: array.first)


for obj in array {
    obj
}

for obj in 0...(array.count-1) {
    obj
}

for obj in 0..<array.count {
    obj
}

for _ in array {
    print(1)
}

for (index,obj) in array.enumerated() {
    index
    obj
}

for index in 6..<array.count {
    print(index)
}

for index in 2...2 {
    "特殊\(index)"
}

for index in 1...10 where index%7 == 1 {
    index
}
