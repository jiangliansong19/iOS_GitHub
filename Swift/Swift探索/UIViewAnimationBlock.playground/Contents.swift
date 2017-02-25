//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class MyTitle: UIView {
    
    var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        //动画演示的View
        view = UIView(frame: CGRect(x: 0, y: 450, width: 150, height: 150))
        view.backgroundColor = UIColor.darkGray
        self.addSubview(view)
        
        //简单移动
        let moveButton = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        moveButton.setTitle("move", for: .normal)
        moveButton.backgroundColor = UIColor.lightGray
        moveButton.addTarget(self, action: #selector(move), for: .touchUpInside)
        self.addSubview(moveButton)
        
        //转场动画,整个父视图旋转
        let transitionButton = UIButton(frame: CGRect(x: 0, y: 50, width: 300, height: 50))
        transitionButton.setTitle("transition", for: .normal)
        transitionButton.backgroundColor = UIColor.orange
        transitionButton.addTarget(self, action: #selector(transition), for: .touchUpInside)
        self.addSubview(transitionButton)
        
        //转场动画，指定的view旋转
        let transitionButton1 = UIButton(frame: CGRect(x: 0, y: 100, width: 300, height: 50))
        transitionButton1.setTitle("selectedViewtransition", for: .normal)
        transitionButton1.backgroundColor = UIColor.purple
        transitionButton1.addTarget(self, action: #selector(selectedViewtransition), for: .touchUpInside)
        self.addSubview(transitionButton1)

        //执行动画
        let performButton = UIButton(frame: CGRect(x: 0, y: 150, width: 300, height: 50))
        performButton.setTitle("performAnimation", for: .normal)
        performButton.backgroundColor = UIColor.blue
        performButton.addTarget(self, action: #selector(performAnimation), for: .touchUpInside)
        self.addSubview(performButton)
        
        //关键帧动画
        let keyframeButton = UIButton(frame: CGRect(x: 0, y: 200, width: 300, height: 50))
        keyframeButton.setTitle("keyframeAnimation", for: .normal)
        keyframeButton.backgroundColor = UIColor.cyan
        keyframeButton.addTarget(self, action: #selector(keyframeAnimation), for: .touchUpInside)
        self.addSubview(keyframeButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func move() {

        //curveEaseInOut,curveEaseIn,curveEaseOut,curveLinear
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x: 0, y: 450, width: 300, height: 150)
        }, completion: { (bool) in
            UIView.animate(withDuration: 1, animations: {
                self.view.frame = CGRect(x: 150, y: 450, width: 150, height: 150)
            })
        })
    }
    
    func transition() {
        
        UIView.transition(with: self, duration: 1, options: .transitionFlipFromLeft, animations: {
            
        }) { (bool) in
            
        }
    }
    
    func selectedViewtransition() {
        
        let fromView = UIView(frame: view.bounds)
        fromView.backgroundColor = UIColor.red
        let toView = UIView(frame: view.bounds)
        toView.backgroundColor = UIColor.cyan
        view.addSubview(fromView)
        
        //这行代码好奇怪。。。。。。。搞不懂！
        CATransaction.flush()
        
        UIView.transition(from: fromView, to: toView, duration: 1.0, options: .transitionFlipFromLeft, completion: nil)
        
    }
    
    func performAnimation() {
        
        // 这个API是不是夭折了。。为猫只有一个delete动画
        UIView.perform(.delete, on: self.subviews, options: [], animations: nil, completion: nil)
    }
    
    func keyframeAnimation() {
        
        UIView.animateKeyframes(withDuration: 3, delay: 0, options: .calculationModeLinear, animations: {
            // 相对开始时间，相对持续时间。都是针对上边的duration而言的
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/3.0, animations: {
                self.view.backgroundColor = UIColor.red
            })
            UIView.addKeyframe(withRelativeStartTime: 1/3.0, relativeDuration: 1/3.0, animations: {
                self.view.backgroundColor = UIColor.yellow
            })
            UIView.addKeyframe(withRelativeStartTime: 2/3.0, relativeDuration: 1/3.0, animations: {
                self.view.backgroundColor = UIColor.green
            })
        }) { (bool) in
            self.keyframeAnimation()
        }
    }
    
}


let view = MyTitle(frame: CGRect(x: 0, y: 0, width: 300, height: 600))
PlaygroundPage.current.liveView = view