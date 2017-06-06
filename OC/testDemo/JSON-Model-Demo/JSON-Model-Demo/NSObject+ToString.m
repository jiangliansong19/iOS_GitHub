//
//  NSObject+ToString.m
//  JSON-Model-Demo
//
//  Created by 江连松 on 2017/6/1.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "NSObject+ToString.h"
#import <objc/runtime.h>

@implementation NSObject (ToString)

- (NSDictionary *)keyValues {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    unsigned int count, i = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for (i = 0; i < count; i++) {
        NSString *name = [NSString stringWithUTF8String:property_getName(properties[i])];
        NSString *value = [NSString stringWithFormat:@"%@",[self valueForKey:name]];
        [dic setValue:value forKey:name];
    }
    return [dic copy];
}

@end
