//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

/*
 MVVM架构模式
 M: model对象，数据访问层。与MVC中的model没有区别，也是数据模型的封装，处理数据的运算。交互:被VM拥有，model对象updates完毕后，通知VM，只与VM交互。
 V: view对象和Controller对象。由于MVC中，view和controller总是紧紧的耦合在一起，controller管理着view，修改view对象，view对象交互的具体实现过程，都是在controller里。交互:拥有VM，VM修改model完毕后，通知V。数据和用户操作绑定，数据部分修改在VM，修改完毕通知V，开始修改UI。
 VM:viewModel对象:拥有并更新修改model对象(可以把model私有化)，处理关于model的逻辑处理。同时处理view对象action中对数据的修改。
 
 
 */

class Person: NSObject {
    var name = ""
    var age = 0
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func updateSqlite(completion:@escaping((Error?)->Void)) {
        DispatchQueue(label: "new").async {
            sleep(3)
            DispatchQueue.main.async {
                completion(nil)
            }
        }
    }
}

class PersonViewModel: NSObject {
    fileprivate var person: Person!
    var personInfo: String = "" {
        didSet {
            self.personInfoDidChange?()
        }
    }
    var personInfoDidChange: (()->())?
    
    func showPersonInfo() {
        self.getFromServer { 
            self.person = Person(name: "jiangliansong", age: 26)
            self.personInfo = "name:" + self.person.name + " age:" + String(self.person.age)
        }
    }
    
    //网络请求
    private func getFromServer(completion:@escaping(() -> ())) {
        DispatchQueue.main.async {
            sleep(1)
            completion()
        }
    }
}

class viewController: UIViewController {
    
    var button: UIButton!
    var personViewModel: PersonViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orange
        
        personViewModel = PersonViewModel()
        personViewModel.personInfoDidChange = {
            self.button.setTitle(self.personViewModel.personInfo, for: .normal)
        }
        
        button = UIButton(frame: CGRect(x: 0, y: 200, width: 375, height: 30))
        button.backgroundColor = UIColor.lightGray
        button.setTitle("点我开始加载", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self.personViewModel, action: #selector(PersonViewModel.showPersonInfo), for: .touchUpInside)
        self.view.addSubview(button)
    }
}


let vc = viewController()
vc.view.frame = CGRect(x: 0, y: 0, width: 375, height: 568)
vc.view.backgroundColor = UIColor.red
PlaygroundPage.current.liveView = vc.view
