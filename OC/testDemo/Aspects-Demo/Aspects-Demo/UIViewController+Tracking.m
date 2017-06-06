
//
//  UIViewController+Tracking.m
//  Aspects-Demo
//
//  Created by 江连松 on 2017/6/1.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "UIViewController+Tracking.h"
#import <objc/message.h>

@implementation UIViewController (Tracking)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originM = class_getClassMethod([self class], @selector(viewWillAppear:));
        Method swizzM = class_getClassMethod([self class], @selector(jls_viewWillAppear:));
        method_exchangeImplementations(originM, swizzM);

        
        NSLog(@"view出现了");
        
        
        method_exchangeImplementations(originM, swizzM);
    });
    
}

- (void)jls_viewWillAppear:(BOOL)animation {

}

@end
