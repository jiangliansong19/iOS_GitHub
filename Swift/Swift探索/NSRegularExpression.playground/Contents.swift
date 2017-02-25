//: Playground - noun: a place where people can play

import UIKit

//NSString *searchText = @"rangeOfString";
//NSRange range = [searchText rangeOfString:@"^[0-9]+$" options:NSRegularExpressionSearch];
//if (range.location != NSNotFound) {
//    NSLog(@"range ：%@", [searchText substringWithRange:range]);
//}


let string = "已漏检：2次" as NSString
let range = string.range(of: "^[]0-9]+$", options: .regularExpression)
range.location
range.length