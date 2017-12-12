//
//  Person.m
//  交换方法的实现
//
//  Created by 江连松 on 2017/9/14.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "Person.h"


@implementation Person

- (void)eat:(NSString *)food {
    NSLog(@"%s -- 大口吃%@",__FUNCTION__,food);
}
- (void)drink:(NSString *)drink {
    NSLog(@"%s -- 大口喝%@",__FUNCTION__,drink);
}

@end
