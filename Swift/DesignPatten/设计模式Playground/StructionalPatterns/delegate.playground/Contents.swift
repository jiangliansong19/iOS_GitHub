//: Playground - noun: a place where people can play

import UIKit

@objc protocol Contract {
    @objc optional func writeCode(_ numberOfLines: NSInteger) -> Double
    @objc optional func washclothes(_ number: Int) -> Double
}

class Coder: Contract {
    func writeCode(_ numberOfLines: NSInteger) -> Double {
        print("程序员辛辛苦苦写了\(numberOfLines)行代码")
        return Double(numberOfLines) * 0.01;
    }
}

class Washer: Contract {
    func washclothes(_ number: Int) -> Double {
        print("洗衣工辛辛苦苦洗了\(number)件衣服")
        return 0.1 * Double(number)
    }
}

class Boss {
    lazy var codeDelegate = Coder()
    lazy var washDelegate = Washer()
    
    func enjoyLife() {
        let codePay = codeDelegate.writeCode(100000)
        print("老板仅仅花了\(codePay)元")
        
        let washPay = washDelegate.washclothes(2000)
        print("老板仅仅花了\(washPay)元")
    }
}

Boss().enjoyLife()
