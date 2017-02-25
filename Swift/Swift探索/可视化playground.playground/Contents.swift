//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

public class ProgressView: UIView {
    
    var progress: Float = 0.0 {
        didSet {
            bgLayer.sublayers?.first?.frame.size.width = bgLayer.frame.width * CGFloat(progress)
            numberLabel.frame.origin.x = bgLayer.frame.width * CGFloat(progress) + 30.0 - 100.0 - 15.0
            numberLabel.text = "\(progress * 100.0)%"
        }
    }
    
    fileprivate var bgView: UIView!
    fileprivate var cancelButton: UIButton!
    fileprivate var bgLayer: CALayer!
    fileprivate var textLabel: UILabel!
    fileprivate var numberLabel: UILabel!
    
    func show(_ content:String, completion:((Void)->Void)) {
        
        setUI()
        setContent(text: content)
        setProgress(progress: progress)
    }
    
    
    func setUI() {
        
        bgView = UIView(frame: UIScreen.main.bounds)
        bgView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        bgView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(backgroundTapGesture(_:))))
        UIApplication.shared.keyWindow?.addSubview(bgView)
        
        
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width*2/3, height: UIScreen.main.bounds.size.width/3)
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        UIApplication.shared.keyWindow?.addSubview(self)
        
        
        let topLayer = CALayer()
        topLayer.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: 40)
        topLayer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.addSublayer(topLayer)
        
        
        cancelButton = UIButton(frame: CGRect(x: self.frame.size.width-60, y: 0, width: 60, height: 40))
        cancelButton.setTitle("关闭", for: .normal)
        cancelButton.setTitleColor(UIColor.orange, for: .normal)
        cancelButton.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(backgroundTapGesture(_:))))
        self.addSubview(cancelButton)
        
        
        bgLayer = CALayer()
        bgLayer.frame = CGRect(x: 0, y: 0, width: self.frame.size.width-60, height: 40)
        bgLayer.position = CGPoint(x: self.center.x, y: self.center.y+30)
        bgLayer.backgroundColor = UIColor.darkGray.cgColor
        bgLayer.cornerRadius = 20
        bgLayer.masksToBounds = true
        self.layer.addSublayer(bgLayer)
        
    }
    
    
    
    func setProgress(progress: Float) {
        
        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: 0, width: 0, height: 40)
        layer.backgroundColor = UIColor.orange.cgColor
        layer.cornerRadius = 20
        layer.masksToBounds = true
        bgLayer.addSublayer(layer)
        
        numberLabel = UILabel(frame: CGRect(x: 0, y: bgLayer.position.y-10.0, width: 100, height: 20))
        numberLabel.textAlignment = .right
        numberLabel.text = "\(progress * 100.0)%"
        numberLabel.font = UIFont.systemFont(ofSize: 15)
        numberLabel.textColor = UIColor.white
        self.addSubview(numberLabel)

    }
    
    func setContent(text: String) {
        
        let maxWidth = self.frame.size.width-60
        let height = (text as NSString).boundingRect(with: CGSize(width:maxWidth,height:2000), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 15)], context: nil).size.height
        
        textLabel = UILabel(frame: CGRect(x: 30, y: bgLayer.position.y-CGFloat(40)-height, width: maxWidth, height: height))
        textLabel.font = UIFont.systemFont(ofSize: 15)
        textLabel.textColor = .black
        textLabel.textAlignment = .center
        textLabel.text = text
        self.addSubview(textLabel)
    }
    
    
    
    func backgroundTapGesture(_ sender:UITapGestureRecognizer) {
        
        UIView.animate(withDuration: 0.5, animations: { 
            self.transform = CGAffineTransform(scaleX: 1.0, y: 0)
            self.bgView.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        }) { (isFinished) in
            self.bgView.removeFromSuperview()
            self.removeFromSuperview()
        }
    }
}


let view = ProgressView()
view.show("正在为您上传，请稍等⌛️") { (Void) in
    
}
view.progress = 0.69
PlaygroundPage.current.liveView = view
