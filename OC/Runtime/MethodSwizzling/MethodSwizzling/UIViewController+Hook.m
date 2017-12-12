//
//  UIViewController+Hook.m
//  MethodSwizzling
//
//  Created by 江连松 on 2017/6/13.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "UIViewController+Hook.h"
#import <objc/message.h>

@implementation UIViewController (Hook)

//1.load和initialize有什么区别？
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originSel = @selector(viewWillAppear:);
        SEL swizzSel = @selector(swizz_viewWillAppear:);
        Method originMethod = class_getInstanceMethod(class, originSel);
        Method swizzMethod = class_getInstanceMethod(class, swizzSel);

        /*2.为什么要用addMethod，为什么不直接调用methodExchange呢？？
        @note class_addMethod will add an override of a superclass's implementation,
        but will not replace an existing implementation in this class.
        To change an existing implementation, use method_setImplementation.
        */
        BOOL didAdded = class_addMethod(class, originSel, method_getImplementation(swizzMethod), method_getTypeEncoding(swizzMethod));
        if (didAdded) {
            class_replaceMethod(class,swizzSel, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
        }else {
            method_exchangeImplementations(originMethod, swizzMethod);
        }
    });
}

- (void)swizz_viewWillAppear:(BOOL)animated {
    [self swizz_viewWillAppear:animated];
    
    NSLog(@"%@ -- appear ",NSStringFromClass([self class]));
}

@end
