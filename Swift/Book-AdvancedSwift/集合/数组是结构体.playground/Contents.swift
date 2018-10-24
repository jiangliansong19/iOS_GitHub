//: Playground - noun: a place where people can play

import UIKit

//在swift中，数组是结构体，而不是类
//写时复制：只有在必要时，才会进行复制。array2=array1时，它们都还在共享内存。
var array1 = ["hello","world"]
var array2 = array1
array2.append("hello")

array1
array2
