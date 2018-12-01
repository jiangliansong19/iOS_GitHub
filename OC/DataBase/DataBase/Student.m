//
//  Student.m
//  DataBase
//
//  Created by 江连松 on 2018/11/2.
//  Copyright © 2018年 jls. All rights reserved.
//

#import "Student.h"

@implementation Student

NSCodingEmplementation

//- (id)initWithCoder:(NSCoder *)decoder {
//    if (self == [super init]) {
//        unsigned int count;
//        Ivar *ivars = class_copyIvarList([self class], &count);
//        for (int i=0; i<count; i++) {
//            Ivar ivar = ivars[i];
//            NSString *ivarName = [NSString stringWithFormat:@"%s", ivar_getName(ivar)];
//            if ([ivarName hasPrefix:@"_"]){
//                ivarName = [ivarName stringByReplacingOccurrencesOfString:@"_" withString:@""];
//            }
//            [self setValue:[decoder decodeObjectForKey:ivarName] forKey:ivarName];
//        }
//        free(ivars);
//    }
//    return self;
//}
//
//- (void)encodeWithCoder:(NSCoder *)coder {
//    unsigned int count;
//    Ivar *ivars = class_copyIvarList([self class], &count);
//    for (int i=0; i<count; i++) {
//        Ivar ivar = ivars[i];
//        NSString *ivarName = [NSString stringWithFormat:@"%s", ivar_getName(ivar)];
//        if ([ivarName hasPrefix:@"_"]){
//            ivarName = [ivarName stringByReplacingOccurrencesOfString:@"_" withString:@""];
//        }
//        [coder encodeObject:[self valueForKey:ivarName] forKey:ivarName];
//    }
//    free(ivars);
//}

@end


@implementation Student(FMDB)



@end


@implementation Student(Family)

- (void)setFirstName:(NSString *)firstName {
    objc_setAssociatedObject(self, @selector(firstName), firstName, OBJC_ASSOCIATION_RETAIN);
}

- (NSString *)firstName {
    return objc_getAssociatedObject(self, _cmd);
}

@end
