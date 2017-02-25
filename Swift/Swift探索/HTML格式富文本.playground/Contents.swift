//: Playground - noun: a place where people can play

import UIKit


var htmlText = "空は<font color=\"blue\">青い</font>。<br>An apple is <font color=\"red\">red</font>。"
do{
    let attrStr = try NSAttributedString(data: htmlText.data(using: String.Encoding.unicode, allowLossyConversion: true)!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
    let msgLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 200, height: 100))
    msgLabel.numberOfLines = 0
    msgLabel.attributedText = attrStr
}catch let error as NSError {
    print(error.localizedDescription)
}




