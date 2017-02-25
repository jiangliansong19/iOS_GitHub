//
//  Meal.swift
//  BuilderPattern
//
//  Created by 江连松 on 2017/2/18.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class Meal: NSObject {

    var array = [Item]()

    func append(item: Item) {
        array.append(item)
    }
    
    func getCost() -> Double {
        return array.reduce(0, { (result, obj) -> Double in
            return result + obj.price!()
        })
    }
    
    func show(items: Array<Item>) {
        
        for obj in items {
            print("name----\(obj.name!())\nprice----\(obj.price!())\npacking----\(obj.packing!())")
            
        }
    }
}
