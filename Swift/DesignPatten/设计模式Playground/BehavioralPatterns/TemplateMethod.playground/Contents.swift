//: Playground - noun: a place where people can play

import UIKit

class BuildHouse {
    final func startBuilding() {
        self.buildBasement()
        self.buildFloor()
        self.buildWall()
        self.buildFloor()
    }
    func buildBasement() {
        assertionFailure("请从写此方法")
    }
    func buildFloor() {
        assertionFailure("请从写此方法")
    }
    func buildWall() {
        assertionFailure("请从写此方法")
    }
    func buildRoof() {
        assertionFailure("请从写此方法")
    }
}

class BuildMuseum: BuildHouse {
    override func buildBasement() {
        print("修建博物馆的地基")
    }
    override func buildFloor() {
        print("修建博物馆的地板")
    }
    override func buildWall() {
        print("修建博物馆的墙壁")
    }
    override func buildRoof() {
        print("修建博物馆的屋顶")
    }
}

class BuildCottage: BuildHouse {
    override func buildBasement() {
        print("修建乡村别墅的地基")
    }
    override func buildFloor() {
        print("修建乡村别墅的地板")
    }
    override func buildWall() {
        print("修建乡村别墅的墙壁")
    }
    override func buildRoof() {
        print("修建乡村别墅的屋顶")
    }
}

var museum = BuildMuseum()
museum.startBuilding()

var cottage = BuildCottage()
cottage.startBuilding()
