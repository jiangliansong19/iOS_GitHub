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
        
        let (accountSignal, accountObserver) = Signal<String,NoError>.pipe()
        accountSignal.filter { (text) -> Bool in
            let scan = Scanner(string: text)
            var number: Int = 0
            return scan.scanInt(&number) && scan.isAtEnd
        }.observeValues { (bool) in
            print("输入了纯数字")
        }
        
        accountSignal.reduce("account") { (a, b) -> String in
            return a + b
        }.observeValues { (text) in
            print("账号:\(text)")
        }

        let (passwordSignal, passwordObserver) = Signal<String,NoError>.pipe()
        passwordSignal.map { text -> Int in
            return text.characters.count
            }.observeValues { (length) in
                print("text.length = \(length)")
        }
        

        let accountTF = UITextField(frame: CGRect(x: 0, y: 100, width: 375, height: 30))
        accountTF.backgroundColor = UIColor.orange
        accountTF.placeholder = "请输入手机号码"
        accountTF.textAlignment = .center
        view.addSubview(accountTF)
        //监听文本输入框
        accountTF.reactive.controlEvents(.editingChanged).observeValues { (tf) in
            accountObserver.send(value: tf.text!)
        }
        
        let passwordTF = UITextField(frame: CGRect(x: 0, y: 150, width: 375, height: 30))
        passwordTF.backgroundColor = UIColor.purple
        passwordTF.placeholder = "请输入密码"
        passwordTF.textAlignment = .center
        view.addSubview(passwordTF)
        passwordTF.reactive.controlEvents(.editingChanged).observeValues { (tf) in
            passwordObserver.send(value: tf.text!)
        }
        
    }
}

let vc = ViewController()
vc.view.frame = CGRect(x: 0, y: 0, width: 375, height: 568)
PlaygroundPage.current.liveView = vc.view