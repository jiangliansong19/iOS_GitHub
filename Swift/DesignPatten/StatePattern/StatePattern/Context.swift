//
//  Context.swift
//  StatePattern
//
//  Created by JLS on 2017/2/23.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class Context: NSObject {

    var state: State?
    
    func pull() {
        //状态的切换的细节部分,在本例中是简单的颜色变化,已经封装在子类的handlepush中实现,这里无需关心
        state?.handlePull(self)
        
        //获取新的结果
        print(state!)
    }
    
    func push() {
        state?.handlePush(self)
        print(state!)
    }
}
