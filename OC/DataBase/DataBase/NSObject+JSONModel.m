//
//  NSObject+JSONModel.m
//  DataBase
//
//  Created by 江连松 on 2018/11/8.
//  Copyright © 2018年 jls. All rights reserved.
//

#import "NSObject+JSONModel.h"
#import <objc/runtime.h>

@implementation NSObject (JSONModel)
+ (id)modelWithKeyValues:(NSDictionary *)dic {
    Class cls = objc_getClass(NSStringFromClass([self class]).UTF8String);
    id obj = [[cls alloc]init];
    unsigned int count, i;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (i=0; i<count; i++) {
        Ivar ivar = ivars[i];
        NSString *ivarName = [NSString stringWithFormat:@"%s", ivar_getName(ivar)];
        if ([ivarName hasPrefix:@"_"])
            ivarName = [ivarName stringByReplacingOccurrencesOfString:@"_" withString:@""];
        if (dic[ivarName])
            [obj setValue:dic[ivarName] forKey:ivarName];
    }
    return obj;
}

- (NSDictionary *)keyvalues {
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:0];
    unsigned int count ,i;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for(i=0; i<count; i++) {
        Ivar ivar = ivars[i];
        NSString *ivarName = [NSString stringWithFormat:@"%s", ivar_getName(ivar)];
        if ([ivarName hasPrefix:@"_"]) {
            ivarName = [ivarName stringByReplacingOccurrencesOfString:@"_" withString:@""];
        }
        result[ivarName] = [self valueForKey:ivarName];
    }
    return result;
}
@end
