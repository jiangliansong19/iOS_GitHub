//
//  Dog.m
//  msg_forward
//
//  Created by 江连松 on 2017/4/18.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (void)sel {
    NSLog(@"Dog 接受接收 %s", __FUNCTION__);//Dog 接受接收 -[Dog sel]
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
}

@end
