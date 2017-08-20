//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import ReactiveSwift
import Result
import ReactiveCocoa


class ViewController: UIViewController {
    
    let (signalA, observeA) = Signal<String, NoError>.pipe()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: CGRect(x: 0, y: 100, width: 375, height: 100))
        button.setTitle("click", for: .normal)
        view.addSubview(button)
        
        self.testDelegate()
        button.reactive.controlEvents(.touchUpInside).observeValues { _ in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
                self.observeA.send(value: "hello world")
            })
        }
    }
    
    func testDelegate() {
        signalA.observeValues { (value) in
            print("====代理==\(value)")
        }
    }
}


let vc = ViewController()
vc.view.frame = CGRect(x: 0, y: 0, width: 375, height: 568)
PlaygroundPage.current.liveView = vc.view
