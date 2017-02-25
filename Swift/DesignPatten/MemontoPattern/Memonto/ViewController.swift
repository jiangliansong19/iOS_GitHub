//
//  ViewController.swift
//  Memonto
//
//  Created by JLS on 2017/2/19.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let careTaker = CareTaker()
        let obj1 = Originator()
        obj1.state = "state #1"
        obj1.state = "state #2"
        careTaker.add(obj1.saveStateToMemento())
        obj1.state = "state #3"
        careTaker.add(obj1.saveStateToMemento())
        obj1.state = "state #4"
        print("currentState: \(obj1.state)")
        
        
        obj1.getStateFromMemento(obj: careTaker.getMemento(0)!)
        print("first save state: \(obj1.state)")
        
        obj1.getStateFromMemento(obj: careTaker.getMemento(1)!)
        print("second save state: \(obj1.state)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

