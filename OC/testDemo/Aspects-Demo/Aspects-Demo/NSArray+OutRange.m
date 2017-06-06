//
//  NSArray+OutRange.m
//  Aspects-Demo
//
//  Created by 江连松 on 2017/6/2.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "NSArray+OutRange.h"
#import <objc/message.h>

@implementation NSArray (OutRange)

+ (void)load {
    
    [super load];
    Method from = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:));
    Method to = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(jls_objectAtIndex:));
    method_exchangeImplementations(from, to);
}



- (id)jls_objectAtIndex:(NSUInteger)index {
    if (index < self.count) {
        return [self jls_objectAtIndex:index];
    }else {
        NSLog(@"=======%s========outRange",__FUNCTION__);
        return nil;
    }
}

@end
