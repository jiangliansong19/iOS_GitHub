//
//  NSObject+ToJSON.m
//  JSON-Model-Demo
//
//  Created by 江连松 on 2017/6/1.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "NSObject+ToJSON.h"
#import <objc/runtime.h>

@implementation NSObject (ToJSON)

+ (id)modelWithJSON:(NSDictionary *)json {
    //动态创建一个类
    Class newClass = objc_getClass(NSStringFromClass([self class]).UTF8String);
    id obj = [[newClass alloc] init];
    
    //动态获取属性，kvc赋值
    unsigned int i, count = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for (i = 0; i<count; i++) {
        const char *s = property_getName(properties[i]);
        NSString *key = [NSString stringWithUTF8String:s];
        [obj setValue:[json objectForKey:key] forKey:key];
    }
    return obj;
}


@end
