//
//  ViewController+Function.m
//  runtime
//
//  Created by 江连松 on 2017/4/22.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController+Function.h"
#import <objc/runtime.h>

@implementation ViewController (Function)


- (void)setAddress:(NSString *)address {
    objc_setAssociatedObject(self, @"MyAddress", address, OBJC_ASSOCIATION_RETAIN);
}

- (NSString *)address {
    return objc_getAssociatedObject(self, @"MyAddress");
}

- (void)eatFood {
    NSLog(@"吃东西");
}

@end
