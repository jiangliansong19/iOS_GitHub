//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let arr = NSArray(array: ["Method","Swift","Swizzling"])
        
        print("-----Swizzling 之前-----")
        print(arr.contains("Swift")) // true
        
        NSArray.swizz() // 方法互换
        
        print("-----Swizzling 之后-----")
        print(arr.contains("Swift")) // 先输出 index，再 true
        
        NSArray.swizz() // 方法再换回来
        
        print("-----Swizzling 两下-----")
        print(arr.contains("Swift")) // true
    }
    
}

extension NSArray {
    
    // 用来和默认方法进行替换的方法
    func myContainsObject(anObject: AnyObject) -> Bool {
        // 输出元素的 index，这是默认的原方法不具有的功能
        if self.myContainsObject(anObject: anObject) {
            let index = self.index(of: anObject)
            print("index：\(index)")
        }
        // 不会产生死循环，因为运行期间，下面的方法已经被替换成了默认的 containsObject
        return self.myContainsObject(anObject: anObject)
    }
    
    // 用来给不同方法互相替换的方法
    class func swizz() {
        let originalMethod = class_getInstanceMethod(NSArray.self, #selector(contains))
        let swizzledMethod = class_getInstanceMethod(NSArray.self, #selector(myContainsObject(anObject:)))
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
}

var vc = ViewController()
vc.view.frame = CGRect(x: 0, y: 0, width: 414, height: 667)
PlaygroundPage.current.liveView = vc.view
