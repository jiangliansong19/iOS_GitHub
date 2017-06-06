//: Playground - noun: a place where people can play

import UIKit

class ChatRoom {
    func show(_ message: String){
        print(message)
    }
}

class Chatter {
    private var name = ""
    private var room: ChatRoom!
    
    init(_ name: String, _ room: ChatRoom) {
        self.name = name
        self.room = room
    }
    func say(_ message: String) {
        print(self.name + "说:")
        room.show(message)
    }
}

var room = ChatRoom()
var chatter1 = Chatter("李思思", room)
var chatter2 = Chatter("习大大", room)
var chatter3 = Chatter("李嘉诚", room)

chatter1.say("我要再拍一回穿越剧")
chatter2.say("同志们辛苦啦")
chatter3.say("我要再挣200亿")