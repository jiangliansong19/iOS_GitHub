//
//  ChatRoom.swift
//  MediatorPattern
//
//  Created by JLS on 2017/2/22.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class ChatRoom: NSObject {

    class func show(_ message:String, _ from:User) {
        print("\(from.name):\(message)")
    }
}


class User: NSObject {
    
    var name: String = ""
    
    init(_ name:String) {
        self.name = name
    }
    
    func send(_ message: String) {
        ChatRoom.show(message, self)
    }
}
