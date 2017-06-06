//: Playground - noun: a place where people can play

import UIKit

//将多个耦合类的抽象部分和实现部分相分离，将抽象按要求组合，实现部分可以独立变化。

protocol People {
    var name: String {get}
}
class Teacher: People {
    var name: String {return "老师"}
}
class Student: People {
    var name: String {return "学生"}
}


protocol Vehicle {
    var type: String {get}
}
class Trunk: Vehicle {
    var type: String {return "火车"}
}
class Bike: Vehicle {
    var type: String {return "自行车"}
}


protocol Road {
    var kind: String {get}
}
class Street: Road {
    var kind: String {return "街头"}
}
class RailWay: Road {
    var kind: String {return "铁路"}
}


class Test {
    private var people: People!
    private var vehicle: Vehicle!
    private var road: Road!
    init(_ people:People, _ vehicle:Vehicle, _ road:Road) {
        self.people = people
        self.vehicle = vehicle
        self.road = road
    }
    func doSomething() {
        print("\(people.name)开着\(vehicle.type),在\(road.kind)上奔驰着")
    }
}


var obj = Test(Teacher(), Bike(), Street())
obj.doSomething()

var obj1 = Test(Student(), Trunk(), RailWay())
obj1.doSomething()
