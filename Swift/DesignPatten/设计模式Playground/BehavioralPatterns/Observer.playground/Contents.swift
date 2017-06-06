//: Playground - noun: a place where people can play

import UIKit

//1.定义了对象间一对多的依赖关系，当一个对象的状态发生改变时，所有依赖于它的对象都会得到通知并自动更新。

let NotificationName = Notification.Name(rawValue: "myNotice")

class Receiver {
    func addNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(receiveNotification(notice:)), name: NotificationName, object: nil)
    }
    
    @objc func receiveNotification(notice: Notification) {
        print(notice.name)
        print(notice.object as? String ?? "")
    }
}

class Poster {
    func postNotification() {
        NotificationCenter.default.post(name: NotificationName, object: "jiang")
    }
}
let obj = Receiver()
obj.addNotificationCenter()
let poster = Poster()
poster.postNotification()



class Person: NSObject {
    dynamic var name = ""//注意这个dynamic，要不然kvo不会执行
    init(name: String) {
        self.name = name
    }
}

class KVOTest: NSObject {
    var person: Person!
    var myContext = 0
    
    override init() {
        super.init()
        self.person = Person(name: "将大大")
    }
    func addObserver() {
        self.person.addObserver(self, forKeyPath: "name", options: [.old,.new], context: &myContext)
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("KVO-----")
        print(keyPath)
        print(context)
        print(object)
    }
    func changPerson() {
        self.person.name = "将君"
    }
}

let kvoTest = KVOTest()
kvoTest.addObserver()
kvoTest.person
kvoTest.changPerson()


