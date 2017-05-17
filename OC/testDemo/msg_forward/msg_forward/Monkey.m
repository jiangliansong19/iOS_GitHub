//
//  Monkey.m
//  msg_forward
//
//  Created by 江连松 on 2017/4/18.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "Monkey.h"
#import "Dog.h"
#import <objc/runtime.h>

@implementation Monkey

- (instancetype)init {
    if (self == [super init]) {
        [self performSelector:@selector(sel) withObject:@"myObject"];
    }
    return self;
}
id dynamicIMP(id self, SEL _cmd, NSString *str) {
    NSLog(@"动态添加方法:%s",__FUNCTION__);//动态添加方法:dynamicIMP
    return @"1";
}
//1.mothod resolution
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    return class_addMethod(self, sel, (IMP)dynamicIMP, "@@");
}
//2.fast forwarding
- (id)forwardingTargetForSelector:(SEL)aSelector {
    return [Dog new];
}
//3.normal forwarding
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    return [NSMethodSignature signatureWithObjCTypes:"#"];
}
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    [[Dog new] performSelector:@selector(sel)];
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    [super doesNotRecognizeSelector:aSelector];
}
@end
