//: Playground - noun: a place where people can play

import UIKit

var customTitle: String?


class BaseViewController: UIViewController {
    
    var customTitle: String?
    
    override func viewDidLoad() {
        print("11")
    }
    
}

class AViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}


let baseVC = BaseViewController()
baseVC.customTitle = "jiang"

let AVC = AViewController()
AVC.customTitle