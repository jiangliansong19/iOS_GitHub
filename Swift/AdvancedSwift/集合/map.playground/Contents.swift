//: Playground - noun: a place where people can play

import UIKit

// 一般使用
var array = [-9,-8,-7,-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9]
array = array.map {$0*$0*$0}
array


array.flatMap{$0-1}
array


// MARK: - flatmap会过滤nil元素
let mapArray = array.map { (index:Int) -> Int? in
    
    if index < 3 {
        return nil
    } else {
        return index*index
    }
}
mapArray


let flatmapArray = array.flatMap { (index:Int) -> Int? in
    if index < 5 {
        return nil
    } else {
        return index*index
    }
}
flatmapArray


// MARK: -
// map函数的内部实现------错误写法
// 这种写法，只能原数组，新数组的元素，都是同一类型。
extension Array {
    
    func maps(transform:(Element)->Element) -> [Element] {
        
        var result:[Element] = []
        result.reserveCapacity(self.count)
        
        for obj in self {
            result.append(transform(obj))
        }
        return result
    }
}

let tempArray1 = [1,2,3,4,5].maps{$0*$0}
tempArray1

let tempArray2 = [1,3,9,27].maps { (index:Int) -> Int in
    return index*index
}
tempArray2

// 报错：Int cannot convert to UIView
//let tempArray3 = [1,2,3,4,5].maps{UIView.init(frame: CGRect(x: $0, y: $0, width: 10, height: 10))}
//tempArray3



// map函数的内部实现------正确写法
// 思考：U是什么，Element
// Element是原数组中的元素类型占位符，U是元素转换后的类型的占位符
extension Array {
    
    func myMap<U>(transform:(Element)->U) -> [U] {
        
        var result:[U] = []
        result.reserveCapacity(self.count)
        
        for x in self {
            result.append(transform(x))
        }
        return result
    }
}
let testArray4 = [1,2,3,4].myMap{UIView.init(frame: CGRect(x: $0, y: $0, width: 10, height: 10))}
testArray4



(1...100).map(String.init)


// MARK: - lazy对map的影响
// 方式一：
let ints1 = 1...4
let results1 = ints1.map { (index) -> Int in
    print("正在处理 index = \(index)")
    return index * 1024
}
for obj in results1 {
    print("处理结果 index = \(obj)")
}

// 方式二:
let ints2 = 1...4
let results2 = ints2.lazy.map { (index) -> Int in
    print("正在处理 index = \(index)")
    return index * 1024
}
for obj in results2 {
    print("处理结果 index = \(obj)")
}