//
//  Student.m
//  交换方法的实现
//
//  Created by 江连松 on 2017/9/14.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "Student.h"

@implementation Student

- (void)play:(NSString *)game {
    NSLog(@"%s -- 玩%@",__FUNCTION__,game);
}
- (void)write:(NSString *)homework {
    NSLog(@"%s -- 做%@",__FUNCTION__,homework);
}

@end
