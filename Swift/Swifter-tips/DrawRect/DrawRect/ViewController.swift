//
//  ViewController.swift
//  DrawRect
//
//  Created by 江连松 on 2016/12/13.
//  Copyright © 2016年 JLS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myView: NineView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView = NineView(frame: CGRect(x:UIScreen.main.bounds.size.width/2-160,y:100,width:320,height:380), actionHandle: { (images) in
            
        })
        self.view.addSubview(myView)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

