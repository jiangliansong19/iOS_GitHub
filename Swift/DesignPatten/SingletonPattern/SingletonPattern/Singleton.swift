//
//  Singleton.swift
//  SingletonPattern
//
//  Created by JLS on 16/10/8.
//  Copyright © 2016年 JLS. All rights reserved.
//

import UIKit

class SingletonA {
    
    static let shared = SingletonA() // 创建静态实例
    private init() {} // 隐藏init方法
    
    
    var count = 0
}

