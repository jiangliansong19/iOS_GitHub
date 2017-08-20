//
//  User.m
//  dispatch_once_t-Demo
//
//  Created by 江连松 on 2017/6/14.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "User.h"

static dispatch_once_t user_onceToken;

@implementation User

+ (User *)sharedInstance {
    static User *user = nil;
    dispatch_once(&user_onceToken, ^{
        user = [[User alloc]init];
    });
    return user;
}

- (void)deleteUser {
    user_onceToken = 0;
}

@end
