//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport


class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 300));
        
        let cString = "\\ude04".cString(using: String.Encoding.utf8)!
        textView.text = NSString(cString: cString, encoding: String.Encoding.ascii.rawValue) as! String
        self.view.addSubview(textView);
    }
    
    
    
}


let VC = MyViewController()
VC.view.frame = CGRect(x: 0, y: 0, width: 320, height: 568);
PlaygroundPage.current.liveView = VC.view