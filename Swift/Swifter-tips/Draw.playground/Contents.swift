//: Playground - noun: a place where people can play

import UIKit

class MyView: UIView {
    
    init(frame: CGRect, actionHandle:((Void)->Void)?) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.lightGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        
        ("jiangliansong" as NSString).draw(at: CGPoint.zero, withAttributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 22)])
        
        UIImage(named: "1.jpg")?.draw(in: CGRect(x: 20, y: 30, width: 100, height: 100))

        
        drawCircle()
        drawCircleLine()
    }

    
    
    
    
    
    
    
    // 画圆饼,注意连线方向与弧度值。连线方向逆时针，弧度值为顺时针
    func drawCircle() {
        
        let context = UIGraphicsGetCurrentContext()
        context?.addArc(center: CGPoint(x:150,y:150), radius: 30, startAngle: 0, endAngle: CGFloat(M_PI_2), clockwise: true)
    }
    
    // 画圆圈
    func drawCircleLine() {
        let context = UIGraphicsGetCurrentContext()
        context?.addArc(center: CGPoint(x:150,y:150), radius: 30, startAngle: 0, endAngle: CGFloat(M_PI_2), clockwise: true)
        context?.setStrokeColor(UIColor.red.cgColor)
        context?.strokePath()
    }
}

let view = MyView(frame: CGRect(x:0,y:0,width:375,height:667)) { (Void) in
    
}
