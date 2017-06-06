//: Playground - noun: a place where people can play

import UIKit

//对比简单工厂模式，每增加一种产品，简单工厂模式需要去修改工厂类的静态方法，增加一个else if 分支。工厂模式，则是每一个产品对应一个工厂，可以随意增加产品，而不需要修改任何方法。

protocol Product {
    func function1()
    func function2()
}

protocol Factory {
    func create() -> Product
}

//增加产品--girl
class GirlFactory: Factory {
    func create() -> Product {
        return Girl()
    }
}
class Girl: Product {
    func function1() {
        print("女孩爱购物")
    }
    func function2() {
        print("女孩爱打扮")
    }
}

//增加产品--boy
class BoyFactory: Factory {
    func create() -> Product {
        return Boy()
    }
}
class Boy: Product {
    func function1() {
        print("男孩要打游戏")
    }
    func function2() {
        print("男孩要打架")
    }
}


let girl = GirlFactory().create()
girl.function2()

let boy = BoyFactory().create()
boy.function1()
