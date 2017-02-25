//: Playground - noun: a place where people can play

import UIKit

extension UIImage {
    
    func resize(newWidth: CGFloat) -> UIImage? {
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width:newWidth, height:newHeight))
        self.draw(in: CGRect(x:0, y:0, width:newWidth, height:newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}


let originImage = UIImage(named: "1.jpg")! // 960*720  564KB
UIImageJPEGRepresentation(originImage, 1)


let resizeImage = originImage.resize(newWidth: 400)!
UIImageJPEGRepresentation(resizeImage, 1)