//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import ReactiveSwift
import Result
import ReactiveCocoa


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        
        self.view.reactive.producer(forKeyPath: "bounds").start { (rect) in
            print("====\(rect)")
        }
    }
}

let vc = ViewController()
vc.view.frame = CGRect(x: 0, y: 0, width: 375, height: 568)
PlaygroundPage.current.liveView = vc.view