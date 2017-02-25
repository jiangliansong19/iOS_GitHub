//
//  Singleton.swift
//  SingletonPattern
//
//  Created by JLS on 16/10/8.
//  Copyright © 2016年 JLS. All rights reserved.
//

import UIKit

class SingletonA {
    
    static let shared = SingletonA()
    private init() {}
    
    
    var count = 0
}

