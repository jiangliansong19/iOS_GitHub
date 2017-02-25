//
//  Student.swift
//  DecoratorPattern
//
//  Created by JLS on 2017/2/16.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

fileprivate let KFatherName = UnsafeRawPointer.init(bitPattern: "KFatherName".hashValue)
fileprivate let KMotherName = UnsafeRawPointer.init(bitPattern: "KMotherName".hashValue)
fileprivate let KStudentDelegate = UnsafeRawPointer.init(bitPattern: "KStudentDelegate".hashValue)


@objc protocol StudentDelegate {
    @objc optional func eatFruit(_ fruitName: String)
    @objc optional func doHomework(_ workName: String)
}

//原有类。装饰模式下，保持这个原有类不发生改变！
class Student: NSObject {

    var classId = ""
    var schoolName = ""
    
}

//装饰模式方法一：分类
extension Student {
    
    // 1.以运行时扩展属性
    var fatherName: String! {
        set {
            objc_setAssociatedObject(self, KFatherName, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            return objc_getAssociatedObject(self, KFatherName) as? String ?? ""
        }
    }
    var motherName: String! {
        set {
            objc_setAssociatedObject(self, KMotherName, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            return objc_getAssociatedObject(self, KMotherName) as? String ?? ""
        }
    }
    
    // 2.扩展方法
    func run(_ meters:NSInteger) {
        print("\(self.fatherName)\(self.motherName)同学 run \(meters)")
    }
}


// 装饰模式方法二：代理协议
extension Student {
    
    var delegate: StudentDelegate? {
        set {
            objc_setAssociatedObject(self, KStudentDelegate, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            return objc_getAssociatedObject(self, KStudentDelegate) as? StudentDelegate
        }
    }
    
    func doSomething() {
        delegate?.doHomework!("语文作业")
        delegate?.eatFruit!("香蕉")
    }
    
}
