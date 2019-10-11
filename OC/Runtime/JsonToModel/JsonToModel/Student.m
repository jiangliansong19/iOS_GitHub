//
//  Person.m
//  JsonToModel
//
//  Created by 江连松 on 2019/8/6.
//  Copyright © 2019 jls. All rights reserved.
//


#import "Student.h"
#import <objc/runtime.h>

@implementation Student

- (id)initWithCoder:(NSCoder *)decoder {\
    if (self == [super init]) {\
        unsigned int count;\
        Ivar *ivars = class_copyIvarList([self class], &count);\
        for (int i=0; i<count; i++) {\
            Ivar ivar = ivars[i];\
            NSString *ivarName = [NSString stringWithFormat:@"%s", ivar_getName(ivar)];\
            if ([ivarName hasPrefix:@"_"]){\
                ivarName = [ivarName stringByReplacingOccurrencesOfString:@"_" withString:@""];\
            }\
            [self setValue:[decoder decodeObjectForKey:ivarName] forKey:ivarName];\
        }\
        free(ivars);\
    }\
    return self;\
}\
- (void)encodeWithCoder:(NSCoder *)coder {\
    unsigned int count;\
    Ivar *ivars = class_copyIvarList([self class], &count);\
    for (int i=0; i<count; i++) {\
        Ivar ivar = ivars[i];\
        NSString *ivarName = [NSString stringWithFormat:@"%s", ivar_getName(ivar)];\
        if ([ivarName hasPrefix:@"_"]){\
            ivarName = [ivarName stringByReplacingOccurrencesOfString:@"_" withString:@""];\
        }\
        [coder encodeObject:[self valueForKey:ivarName] forKey:ivarName];\
    }\
    free(ivars);\
}

@end
