//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import ReactiveSwift
import Result
import ReactiveCocoa


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.reactive.notifications(forName: Notification.Name.init(rawValue: "main")).observeValues { (notice) in
            print(notice.object ?? "")
        }
        
        NotificationCenter.default.post(name: Notification.Name.init(rawValue: "main"), object: "helloWorld")
    }
}

let vc = ViewController()
vc.view.frame = CGRect(x: 0, y: 0, width: 375, height: 568)
PlaygroundPage.current.liveView = vc.view