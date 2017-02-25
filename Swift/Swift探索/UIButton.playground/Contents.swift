//: Playground - noun: a place where people can play


import UIKit
import PlaygroundSupport



class MyTestView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .orange
        self.addButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addButton() {
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.center = self.center
        button.setTitle("jiangliansong", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2.0
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        self.addSubview(button)
    }
    
    func buttonAction(_ sender:UIButton) {
        
        print("jiaingliansong")
    }
}

let view = MyTestView(frame: CGRect(x: 0, y: 0, width: 375, height: 500))
PlaygroundPage.current.liveView = view