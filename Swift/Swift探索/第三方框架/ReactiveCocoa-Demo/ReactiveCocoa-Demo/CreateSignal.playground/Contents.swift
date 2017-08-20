//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import ReactiveSwift
import Result
import ReactiveCocoa


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1.通过信号发生器创建(冷信号)
        let producer = SignalProducer<String, NoError>.init { (observe, _) in
            observe.send(value: "hello")
            observe.send(value: "world")
        }
        
        let observer1 = Observer<String, NoError>(value:{
            print("======观察者1收到值\($0)")
        })
        let observer2 = Observer<String, NoError>(value:{
            print("======观察者2收到值\($0)")
        })
        
        producer.start(observer1)
        producer.start(observer2)
        
        
        
        //2.通过管道创建(热信号）
        let (signalA, observeA) = Signal<String, NoError>.pipe()
        let (signalB, observeB) = Signal<String, NoError>.pipe()
        //信号合并
        Signal.combineLatest(signalA, signalB).observeValues { value in
            print("收到的值为 \(value.0) + \(value.1)")
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
