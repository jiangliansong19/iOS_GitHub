//
//  Person.h
//  JsonToModel
//
//  Created by 江连松 on 2019/8/6.
//  Copyright © 2019 jls. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject<NSCoding>
{
@public
    NSUInteger _classId;
    NSString *_address;
}
@property(nonatomic, assign) NSUInteger studentId;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) int age;
@property(nonatomic, copy) NSString *phoneNo;

@end
