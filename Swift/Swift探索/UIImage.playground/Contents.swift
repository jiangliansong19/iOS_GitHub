//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class MyView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.blue
        self.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
        
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        label.text = "jiangliansong"
        label.backgroundColor = UIColor.red
        self.addSubview(UIImageView(image: UIImage.getImage(fromView: label)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension UIImage {
    /// 把一个UIView变换称为UIImage
    ///
    /// - Parameter fromView: UIView
    /// - Returns: 返回想要的图片
    class func getImage(fromView:UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(fromView.frame.size, false, 0.0)
        fromView.layer .render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!;
    }
}

PlaygroundPage.current.liveView = MyView()




