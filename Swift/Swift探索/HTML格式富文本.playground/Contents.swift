//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

var htmlText = "空は<font color=\"blue\">青い</font>。<br>An apple is <font color=\"red\">red</font>。"

extension UILabel {
    convenience init(html: String) {
        self.init()
        
        do{
            let attrStr = try NSAttributedString(data: html.data(using: String.Encoding.unicode, allowLossyConversion: true)!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
            self.attributedText = attrStr
        }catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}

let label = UILabel(html: htmlText)
label.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
label.backgroundColor = UIColor.white
PlaygroundPage.current.liveView = label



