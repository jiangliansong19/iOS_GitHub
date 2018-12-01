//
//  Student.h
//  DataBase
//
//  Created by 江连松 on 2018/11/2.
//  Copyright © 2018年 jls. All rights reserved.
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


@interface Student(FMDB)

//- (NSArray *)findStudent:(NSDictionary *)predicate;
//
//+ (void)deleteStudent:(Student *)stu;
//
//+ (void)addStudent:(Student *)stu;
//
//+ (void)updateStudent:(Student *)stu;

@end

@interface Student(Family)

@property (nonatomic, copy) NSString *firstName;

@end
