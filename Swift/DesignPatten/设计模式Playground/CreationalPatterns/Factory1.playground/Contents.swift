//: Playground - noun: a place where people can play

import UIKit

//优化，将产品创建方法，和抽象产品类融合

class Product: NSObject {
    func create() -> Product{
        assertionFailure()
        return Product.init()
    }
    func function1(){
        assertionFailure()
    }
    func function2() {
        assertionFailure()
    }
}

class Girl: Product {
    override func create() -> Product {
        return Girl()
    }
    override func function1() {
        print("女孩爱逛街")
    }
    override func function2() {
        print("女孩爱打扮")
    }
}

class Boy: Product {
    override func create() -> Product {
        return Boy()
    }
    override func function1() {
        print("男孩要打游戏")
    }
    override func function2() {
        print("男孩要打架")
    }
}


let boy = Boy().create()
boy.function2()

let girl = Girl().create()
girl.function1()
