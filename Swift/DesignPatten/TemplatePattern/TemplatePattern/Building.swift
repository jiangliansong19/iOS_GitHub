//
//  Building.swift
//  TemplatePattern
//
//  Created by JLS on 2017/2/19.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class Building {

    func buyMaterials() {}
    func buildFoundation() {}
    func buildWall() {}
    func buildRoof() {}
    
    final func build() {
        self.buyMaterials()
        self.buildFoundation()
        self.buildWall()
        self.buildRoof()
    }
}


class Cottage: Building {
    
    override func buyMaterials() {
        print("购买了10000元的钢筋，水泥，砖头")
    }
    
    override func buildFoundation() {
        print("使用大理石打地基")
    }
    
    override func buildWall() {
        print("建了一面粉色的墙")
    }
    
    override func buildRoof() {
        print("屋顶被涂抹成暗红色")
    }
}

