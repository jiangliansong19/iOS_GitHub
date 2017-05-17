//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport


struct Person {
    var name = ""
    var age = 0
}

protocol InfoDelegate: class {
    func setPersonInfo(info: String)
}

class InfoViewPresenter {
    var person: Person!
    var infoVC: InfoDelegate!
    
    required init(person: Person, infoVC: InfoDelegate) {
        self.person = person
        self.infoVC = infoVC
    }
    
    func showPersonInfo() {
        let personInfo = "name:" + person.name + "  age:" + String(person.age)
        self.infoVC.setPersonInfo(info: personInfo)
    }
}

class PersonInfoController: UIViewController, InfoDelegate {
    var button: UIButton!
    var presenter: InfoViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        
        button = UIButton(frame: CGRect(x: 0, y: 200, width: 375, height: 30))
        button.backgroundColor = UIColor.lightGray
        button.setTitle("点我开始加载", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(showPersonInfo), for: .touchUpInside)
        self.view.addSubview(button)
        
        presenter = InfoViewPresenter(person: Person(name: "jiangliansong", age: 26), infoVC: self)
    }
    
    func showPersonInfo() {
        self.presenter.showPersonInfo()
    }
    
    func setPersonInfo(info: String) {
        button.setTitle(info, for: .normal)
    }
}


let vc = PersonInfoController()
vc.view.frame = CGRect(x: 0, y: 0, width: 375, height: 568)
PlaygroundPage.current.liveView = vc.view
