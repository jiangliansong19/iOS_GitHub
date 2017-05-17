//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

/*
 MVC架构模式
 M: 模型对象。封装数据，并定义了操作和处理该数据的运算。例如数据永久化操作。
    controller可以直接修改model数据。耗时操作，可以通过block或者delegate回调通知controler。
 V: 视图对象。封装了可视UI，定义了UI怎么绘制，动画显示，怎么响应用户操作。
    controller可以直接修改UI对象，view的action具体实现部分，一般通过代理由controller实现。
 C: 模型和对象之间的媒介。视图随model而动，model随视图操作而改动。
 
 不足: 
 1.model层太过轻量级。model层如果不涉及数据永久化，就没什么代码了。
 2.controller层太过笨重。controller层代理太多，逻辑太多，还有网络请求。
 3.测试性差。view与controller夹杂在一起，无法测试。
 4.网络层丢失。没地方写网络请求，放在controller太冗余。
 
 MVC改进:
 1.提高代码封装程度。例如view中，将UI的修改封装成接口，供controller直接调用。提高公共类的封装。
 2.大量使用controller分类。将不同功能的接口和变量分散到不同的controller分类中。
 3.增加netManager类。主要基于model封装网络请求，该封装处理json解析，网络数据处理。controller简单调用即可。不在model里写网络请求:如果contoller的变量调用网络请求，变量随着controller释放了，而异步的网络请求还在继续，会有问题。
 4.为了提高测试性，尽可能的多使用接口参数，不使用controller的全局变量。
 
 */


protocol MyViewDelegate {
    func buttonClickOnMyView()
}

class MyView: UIView {
    
    var button: UIButton!
    var delegate: MyViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.orange
        
        button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        button.setTitle("蓝色", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        addSubview(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonAction() {
        delegate?.buttonClickOnMyView()
    }
}

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

class viewController: UIViewController, MyViewDelegate {
    
    var customView: MyView!
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGray
        
        customView = MyView(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        customView.delegate = self
        self.view.addSubview(customView)
        
        person = Person(name:"jiangliansong",age:25)
    }
    
    func buttonClickOnMyView() {
        
        person.updateSqlite { (error) in
            if error == nil {
                self.customView.button.setTitle("绿色", for: .normal)
                self.customView.button.setTitleColor(UIColor.green, for: .normal)
            }
        }
    }
}


let vc = viewController()
vc.view.frame = CGRect(x: 0, y: 0, width: 375, height: 568)
PlaygroundPage.current.liveView = vc.view
