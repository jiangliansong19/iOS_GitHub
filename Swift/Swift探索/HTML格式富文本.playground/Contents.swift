//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport


var htmlText = "<a href=\"https://www.baidu.com\">点一下，百度搜索</a>"


func setupString(_ html:String) -> NSAttributedString {
    do{
        let attrStr = try NSAttributedString(data: html.data(using: String.Encoding.unicode, allowLossyConversion: true)!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
        return attrStr
    }catch let error as NSError {
        print(error.localizedDescription)
    }
    
    return NSAttributedString();
}


let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
label.attributedText = setupString(htmlText)

PlaygroundPage.current.liveView = label
