//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import ReactiveSwift
import Result
import ReactiveCocoa


class ViewController: UIViewController {
    var accountTF: UITextField!
    var passTF: UITextField!
    var label: UILabel!
    var message = MutableProperty("")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        accountTF.reactive.controlEvents(.editingChanged).observeValues { tf in
            print(tf.text ?? "")
            self.message.value = tf.text!
        }
        
        self.label.reactive.text <~ self.message
        
        passTF.reactive.continuousTextValues.observeValues { (text) in
            print(text ?? "")
        }

        
    }
    
    func setupUI() {
        accountTF = UITextField(frame: CGRect(x: 0, y: 100, width: 375, height: 30))
        accountTF.backgroundColor = UIColor.lightGray
        accountTF.placeholder = "请输入账号"
        accountTF.textAlignment = .center
        view.addSubview(accountTF)
        
        passTF = UITextField(frame: CGRect(x: 0, y: 150, width: 375, height: 30))
        passTF.backgroundColor = UIColor.orange
        passTF.placeholder = "请输入密码"
        passTF.textAlignment = .center
        view.addSubview(passTF)
        
        label = UILabel(frame: CGRect(x: 0, y: 200, width: 375, height: 30))
        label.backgroundColor = UIColor.green
        label.textAlignment = .center
        label.textColor = UIColor.red
        view.addSubview(label)
    }
}


let vc = ViewController()
vc.view.frame = CGRect(x: 0, y: 0, width: 375, height: 568)
PlaygroundPage.current.liveView = vc.view
