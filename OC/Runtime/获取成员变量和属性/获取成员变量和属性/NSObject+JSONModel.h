//
//  NSObject+Model.h
//  获取成员变量和属性
//
//  Created by 江连松 on 2017/6/13.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JSONModel)

+ (id)modelWithKeyValues:(NSDictionary *)dic;
- (NSDictionary *)keyValues;

@end
