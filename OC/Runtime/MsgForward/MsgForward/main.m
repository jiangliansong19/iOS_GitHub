//
//  main.m
//  MsgForward
//
//  Created by 江连松 on 2017/6/13.
//  Copyright © 2017年 JLS. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <objc/message.h>
#import "Student.h"

@interface Person : NSObject

@end

@implementation Person

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    class_addMethod([self class], @selector(eat), (IMP)dynamicIMP, "@v");
    return YES;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == sel_registerName("drink")) {
        return [Student new];
    }
    return nil;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == sel_registerName("run")) {
        NSMethodSignature *sig = [NSMethodSignature signatureWithObjCTypes:"v@"];
        return sig;
    }
    return nil;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    [anInvocation invokeWithTarget:[Student new]];
}

id dynamicIMP(id self, SEL _cmd) {
    NSLog(@"===%@",NSStringFromClass([self class]));
    NSLog(@"===%@",NSStringFromSelector(_cmd));
    return @"1";
}

@end





#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Person *per = [[Person alloc]init];
        objc_msgSend(per, sel_registerName("eat"));
        objc_msgSend(per, sel_registerName("drink"));
        objc_msgSend(per, sel_registerName("run"));
    }
    return 0;
}
