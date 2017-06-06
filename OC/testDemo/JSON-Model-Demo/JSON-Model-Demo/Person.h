//
//  Person.h
//  JSON-Model-Demo
//
//  Created by 江连松 on 2017/6/1.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, assign) int age;

@end
