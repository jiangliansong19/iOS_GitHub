//
//  main.m
//  交换方法的实现
//
//  Created by 江连松 on 2017/6/12.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>
#import "Women.h"
#import "Women+Ext.h"
#import "Person.h"
#import "Student.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");

        //同一个对象交换方法的实现部分。eat和drink互换实现部分
        Method eat = class_getInstanceMethod([Person class], sel_registerName("eat:"));
        Method drink = class_getInstanceMethod([Person class], sel_registerName("drink:"));
        method_exchangeImplementations(eat, drink);
        
        //替换方法的实现部分。eat被替换成play
        Method play = class_getInstanceMethod([Student class], sel_registerName("play:"));
        class_replaceMethod([Person class], sel_registerName("eat:"), method_getImplementation(play), "v@");
        
        Person *per = [[Person alloc]init];
        [per eat:@"超级汉堡"];
        [per drink:@"焦糖咖啡"];

        
//        Method eat = class_getInstanceMethod([Person class], sel_registerName("eat:"));
//        Method play = class_getInstanceMethod([Student class], sel_registerName("play:"));
//        BOOL success = class_addMethod([Student class], @selector(eat:), method_getImplementation(eat), method_getTypeEncoding(eat));
//        if (success) {
//            method_exchangeImplementations(eat, play);
//            class_replaceMethod(<#__unsafe_unretained Class cls#>, <#SEL name#>, <#IMP imp#>, <#const char *types#>)
//        }
//
//        [[Student new] performSelector:@selector(eat:) withObject:@"辅助牛腩"];
        
    }
    return 0;
}
