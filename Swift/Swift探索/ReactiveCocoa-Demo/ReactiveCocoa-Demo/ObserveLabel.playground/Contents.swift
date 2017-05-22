//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import ReactiveSwift
import Result
import ReactiveCocoa


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: CGRect(x: 0, y: 100, width: 375, height: 100))
        button.setTitle("click", for: .normal)
        view.addSubview(button)
        
        let label = UILabel(frame: CGRect(x: 0, y: 150, width: 375, height: 30))
        label.backgroundColor = UIColor.lightGray
        view.addSubview(label)
        
        
        button.reactive.controlEvents(.touchUpInside).observeValues { _ in
            print("=========\("click on button")")
        }
    }
}


let vc = ViewController()
vc.view.frame = CGRect(x: 0, y: 0, width: 375, height: 568)
PlaygroundPage.current.liveView = vc.view