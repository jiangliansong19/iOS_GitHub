//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import Bond
import Diff
import ReactiveKit

class Person {
    var account = Observable<String?>("")
    var password = Observable<String?>("")
    var age = 0
}

class PersonViewModel {
    var person: Person?
    init(_ person: Person) {
        self.person = person
    }
}

class ViewController: UIViewController {
    var viewModel: PersonViewModel!
    var accountTF: UITextField!
    var passTF: UITextField!
    var label: UILabel!
    var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialConfigure()
        
        //UI与UI绑定
        accountTF.reactive.text.bind(to: label)
        
        //修改model
        passTF.reactive.text.observeNext { text in
            self.viewModel.person?.password.value = text
        }
        
        //model数据与UI绑定
        viewModel.person?.password.bind(to: label.reactive.text)
        
        //button点击检测
        loginButton.reactive.controlEvents(.touchUpInside).observeNext {
            print("loginButton did clicked")
        }
        
        //多条数据组合
        combineLatest(accountTF.reactive.text, passTF.reactive.text){ a, b in
            return a!.isEmpty == false && b!.isEmpty == false
        }.bind(to: loginButton.reactive.isEnabled)
        
    }
    
    func initialConfigure() {
        
        var person = Person()
        person.account = Observable("18627")
        viewModel = PersonViewModel(person)
        
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
        
        loginButton = UIButton(frame: CGRect(x: 0, y: 250, width: 175, height: 30))
        loginButton.setTitle("登录", for: .normal)
        loginButton.backgroundColor = UIColor.purple
        loginButton.isEnabled = false
        view.addSubview(loginButton)
    }
}


let vc = ViewController()
vc.view.frame = CGRect(x: 0, y: 0, width: 375, height: 568)
PlaygroundPage.current.liveView = vc.view
