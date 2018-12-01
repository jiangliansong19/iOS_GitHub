//
//  NSObject+KeyValues.m
//  DataBase
//
//  Created by 江连松 on 2018/11/2.
//  Copyright © 2018年 jls. All rights reserved.
//

#import "NSObject+KeyValues.h"

@implementation NSObject (KeyValues)

//- (NSDictionary *)keyvalues {
//    NSMutableDictionary *result = [NSMutableDictionary dictionary];
//    
//    unsigned int count = 0;
//    objc_property_t *properties =  class_copyPropertyList([self class], &count);
//    for (int i=0; i<count; i++) {
//        objc_property_t property = properties[i];
//        NSString *key = [NSString stringWithUTF8String:property_getName(property)];
//        [result setValue:[self valueForKey:key] forKey:key];
//    }
//    return [result copy];
//}

@end
