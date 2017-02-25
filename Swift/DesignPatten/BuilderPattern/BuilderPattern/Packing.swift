//
//  Packing.swift
//  BuilderPattern
//
//  Created by 江连松 on 2017/2/18.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit


@objc protocol Packing {
    @objc optional func pack() -> String
}




class Bottol: Packing {
    func pack() -> String {
        return "bottol"
    }
}

class Wrapper: Packing {
    func pack() -> String {
        return "wrapper"
    }
}
