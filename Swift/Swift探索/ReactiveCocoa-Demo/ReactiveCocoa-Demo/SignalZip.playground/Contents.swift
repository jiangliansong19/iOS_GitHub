//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import ReactiveSwift
import Result
import ReactiveCocoa


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let (signalA, observeA) = Signal<String, NoError>.pipe()
        let (signalB, observeB) = Signal<String, NoError>.pipe()
        
        Signal.zip(signalA, signalB).observeValues { (value) in
            print("收到的值 \(value.0) + \(value.1)")
        }
        
        observeA.send(value: "1")
        observeA.sendCompleted()
        observeB.send(value: "2")
        observeB.sendCompleted()
    }
}

let vc = ViewController()
vc.view.frame = CGRect(x: 0, y: 0, width: 375, height: 568)
PlaygroundPage.current.liveView = vc.view
