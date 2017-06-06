

//
//  Computer.m
//  ReactiveCocoa-Demo
//
//  Created by 江连松 on 2017/6/2.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "Computer.h"

@implementation Computer
- (void)run {
    NSLog(@"run 100m");
}

- (Computer *(^)(int))add {
    
    return ^Computer * (int count) {
        static int number;
        number += count;
        Computer *obj = [[Computer alloc]init];
        NSLog(@"===%d",number);
        return obj;
    };
}

@end
