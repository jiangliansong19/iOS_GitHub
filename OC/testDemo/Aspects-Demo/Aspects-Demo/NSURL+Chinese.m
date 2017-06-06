//
//  NSURL+Chinese.m
//  Aspects-Demo
//
//  Created by 江连松 on 2017/6/1.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "NSURL+Chinese.h"
#import <objc/runtime.h>

@implementation NSURL (Chinese)

+ (void)load {
    
    [super load];
    Method originM = class_getClassMethod([self class], @selector(URLWithString:));
    Method swizziM = class_getClassMethod([self class], @selector(jls_urlWithString:));
    
    method_exchangeImplementations(originM, swizziM);
}

+ (NSURL *)jls_urlWithString:(NSString *)str {
    NSLog(@"%s",__FUNCTION__);
    NSURL *url = [self jls_urlWithString:str];
    if (url) {
        return url;
    }
    NSLog(@"===============%s=======url为空",__FUNCTION__);
    return nil;
}

@end
