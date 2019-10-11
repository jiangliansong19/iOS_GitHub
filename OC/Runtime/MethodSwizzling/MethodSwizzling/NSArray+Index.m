
//
//  NSArray+Index.m
//  MethodSwizzling
//
//  Created by 江连松 on 2019/8/6.
//  Copyright © 2019 JLS. All rights reserved.
//

#import "NSArray+Index.h"
#import <objc/message.h>

@implementation NSArray (Index)

+ (void)load {
    
    Class cls = NSClassFromString(@"__NSArrayI");
    Method oldMethod1 = class_getInstanceMethod(cls, @selector(objectAtIndex:));
    Method newMethod1 = class_getInstanceMethod(cls, @selector(newObjectAtIndex:));
    method_exchangeImplementations(oldMethod1, newMethod1);
    
    Method oldMethod2 = class_getInstanceMethod(cls, @selector(objectAtIndexedSubscript:));
    Method newMethod2 = class_getInstanceMethod(cls, @selector(newObjectAtIndexedSubscript:));
    method_exchangeImplementations(oldMethod2, newMethod2);
}

- (id)newObjectAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        return nil;
    }
    return [self newObjectAtIndex:index];
}

- (id)newObjectAtIndexedSubscript:(NSUInteger)idx {
    if (idx >= self.count) {
        return nil;
    }
    return [self newObjectAtIndexedSubscript:idx];
}

@end
