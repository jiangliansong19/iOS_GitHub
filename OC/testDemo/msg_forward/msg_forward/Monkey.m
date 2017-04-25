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

//id dynamicIMP(id self, SEL _cmd, NSString *str) {
//    NSLog(@"_cmd = %@", NSStringFromSelector(_cmd));//_cmd = sel
//    NSLog(@"str = %@", str);//str = myObject
//    NSLog(@"动态添加方法:%s",__FUNCTION__);//动态添加方法:dynamicIMP
//    return @"1";
//}
//
////1.mothod resolution
//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    class_addMethod(self, sel, (IMP)dynamicIMP, "@");
//    [super resolveInstanceMethod:sel];
//    return YES;
//}


////2.fast forwarding
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    id result = [super forwardingTargetForSelector:aSelector];
//    result = [Dog new];
//    return result;
//}


//3.normal forwarding
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    id result = [super methodSignatureForSelector:aSelector];
    NSMethodSignature *sig = [NSMethodSignature signatureWithObjCTypes:"#"];
    result = sig;
    return result;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    [[Dog new] performSelector:@selector(sel) withObject:nil];
    anInvocation.target = [Dog new];
    anInvocation.selector = @selector(sel);
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    [super doesNotRecognizeSelector:aSelector];
}
@end
