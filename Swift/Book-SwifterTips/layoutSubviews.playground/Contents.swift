//: Playground - noun: a place where people can play

import UIKit

class MyView: UIView {
    
    
    init(frame: CGRect, label: String) {
        super.init(frame: frame)
        self.label = label
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var label: String = ""
    
    override func layoutSubviews() {
        
        self.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        
    }
}


class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        
        let view = MyView(frame: CGRect(x:0,y:100,width:200,height:20), label: <#T##String#>)
        self.view.addSubview(<#T##view: UIView##UIView#>)
        
    }
    
}