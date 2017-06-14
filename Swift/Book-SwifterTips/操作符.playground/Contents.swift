//: Playground - noun: a place where people can play

import UIKit

struct Vector2D {
    
    var x = 0.0
    var y = 0.0
}

func +(left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

let v1 = Vector2D(x: 1.0, y: 1.0)
let v2 = Vector2D(x: 2.0, y: 2.0)
let v3 = v1 + v2
v3 