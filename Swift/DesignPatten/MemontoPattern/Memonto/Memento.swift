//
//  Memento.swift
//  Memonto
//
//  Created by JLS on 2017/2/19.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class Memento {

    var state = ""
    
    init(state: String) {
        self.state = state
    }
}


class Originator {
    
    var state = ""
    
    //保存
    func saveStateToMemento() -> Memento {
        return Memento(state: self.state)
    }
    
    //获取
    func getStateFromMemento(obj: Memento) {
        state = obj.state
    }
    
}


class CareTaker {
    
    var mementoList = [Memento]()
    
    func add(_ memento: Memento) {
        mementoList.append(memento)
    }
    
    func getMemento(_ index: Int) -> Memento? {
        if index < mementoList.count {
            return mementoList[index]
        }else {
            return nil
        }
    }
}
