//
//  main.m
//  增加一个类-方法-属性
//
//  Created by 江连松 on 2017/6/12.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>

id eatIMP(id self, SEL cmd, NSString *food) {
    NSLog(@"%@%@",NSStringFromClass([self class]),food);
    return @"1";
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        //动态创建一个类
        Class baseClass = objc_getClass("NSObject");
        const char *subClassName = @"Person".UTF8String;
        Class subClass = objc_getClass(subClassName);
        if (subClass == nil) {
            subClass = objc_allocateClassPair(baseClass, subClassName, 0);
            if (subClass == nil) {
                NSLog(@"allocate subClass error");
            }
        }
        objc_registerClassPair(subClass);
        
        id obj = [[subClass alloc] init];
        //动态创建一个方法
        class_addMethod(obj, sel_registerName("eat:"), (IMP)eatIMP, "v@:");
        objc_msgSend(obj, sel_registerName("eat:"),@"牛肉拉面");
        
    }
    return 0;
}
