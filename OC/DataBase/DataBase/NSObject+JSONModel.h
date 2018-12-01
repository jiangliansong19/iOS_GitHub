//
//  NSObject+JSONModel.h
//  DataBase
//
//  Created by 江连松 on 2018/11/8.
//  Copyright © 2018年 jls. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JSONModel)
+ (id)modelWithKeyValues:(NSDictionary *)dic;
- (NSDictionary *)keyvalues;
@end
