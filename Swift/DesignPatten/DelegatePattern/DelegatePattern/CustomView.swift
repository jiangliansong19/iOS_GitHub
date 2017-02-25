//
//  CustomView.swift
//  DelegatePattern
//
//  Created by JLS on 2017/2/20.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

protocol HorseDelegate {
    func run(meter: NSInteger)
}

class CustomView: UIView {

    var delegate: HorseDelegate?
    private var meters: NSInteger = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        button.center = self.center
        button.setTitle("🐎", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.addSubview(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buttonAction() {
        meters += 1
        delegate?.run(meter: meters)
    }
}
