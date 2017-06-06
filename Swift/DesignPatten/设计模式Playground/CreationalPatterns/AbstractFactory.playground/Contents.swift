
//: Playground - noun: a place where people can play

import UIKit

//a,b产品族，可以将抽象工厂类和产品类融合在一起
protocol ProductA {
    func functionA1()
    func functionA2()
}
protocol ProductB {
    func functionB1()
    func functionB2()
}
protocol AbstractFactory {
    func createA() -> ProductA
    func createB() -> ProductB
}

//具体产品
class ChineseProductA: ProductA {
    func functionA1() {
        print("中国产品功能A1")
    }
    func functionA2() {
        print("中国产品功能A2")
    }
}
class AmericanProductA: ProductA {
    func functionA1() {
        print("美国产品功能A1")
    }
    func functionA2() {
        print("美国产品功能A2")
    }
}
class ChineseProductB: ProductB {
    func functionB1() {
        print("中国产品功能B1")
    }
    func functionB2() {
        print("中国产品功能B2")
    }
}
class AmericanProductB: ProductB {
    func functionB1() {
        print("美国产品功能B1")
    }
    func functionB2() {
        print("美国产品功能B2")
    }
}

//具体工厂，
//可以很简单的在增加一个产品族，例如增加一个JapanFactory,但是很难增加一个产品，增加产品需要需要修改所有的工厂。
class ChinaFactory: AbstractFactory {
    func createA() -> ProductA {
        return ChineseProductA()
    }
    func createB() -> ProductB {
        return ChineseProductB()
    }
}
class AmericaFactory: AbstractFactory {
    func createA() -> ProductA {
        return AmericanProductA()
    }
    func createB() -> ProductB {
        return AmericanProductB()
    }
}

let obj = ChinaFactory().createA()
obj.functionA2()
obj.functionA1()

let obj1 = AmericaFactory().createB()
obj1.functionB1()

