//
//  NineView.swift
//  DrawRect
//
//  Created by 江连松 on 2016/12/13.
//  Copyright © 2016年 JLS. All rights reserved.
//

import UIKit

class NineView: UIView {
    
    init(frame: CGRect, actionHandle:@escaping (([UIImage])->Void)) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        actionClosure = actionHandle
        
        photos = [0,1,2,3,4,5,6,7,8].map{UIImage(named:String($0)+".jpg")!}
        upAndDown()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var photos = [UIImage]()
    var actionClosure:(([UIImage])->Void)!

    override func draw(_ rect: CGRect) {
        
        for (index,frame) in calculateFrames().enumerated() {
            photos[index].draw(in: frame)
        }
    }
    
    func calculateFrames() -> [CGRect] {
        
        var frames = [CGRect]()
        for index in 0..<photos.count {
            
            let originX = 110*(index%3)
            let originY = 110*(index/3)
            frames.append(CGRect(x: originX, y: originY, width: 100, height: 100))
        }
        return frames
    }
    

    
}


extension NineView {
    
    func upAndDown() {
        
        let downButton = UIButton(frame: CGRect(x: 0, y: 320, width: 160, height: 60))
        downButton.setTitle("➖", for: .normal)
        downButton.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        downButton.addTarget(self, action: #selector(down(_:)), for: .touchUpInside)
        self.addSubview(downButton)
        
        let upButton = UIButton(frame: CGRect(x: 160, y: 320, width: 160, height: 60))
        upButton.setTitle("➕", for: .normal)
        upButton.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        upButton.addTarget(self, action: #selector(up(_:)), for: .touchUpInside)
        self.addSubview(upButton)
    }
    
    func down(_:UIButton) {
        
        if photos.count > 0 {
            photos.removeLast()
            setNeedsDisplay()
        }

    }
    
    func up(_:UIButton) {
        
        if photos.count < 9 {
            photos.append(UIImage(named:String(photos.count)+".jpg")!)
            setNeedsDisplay()
        }
        
    }
    
}
