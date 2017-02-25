//: Playground - noun: a place where people can play

import UIKit

var string1: String {
get {
    print(1)
    return "jiang"
}
}

var string2: String {
get {
    print(2)
    return string1 + "liann"
}
}


var string3: String {
    
get {
    print(3)
    return string2 + "song"
}
}

let firstName = string1
let lastName = string2
let myName = string3