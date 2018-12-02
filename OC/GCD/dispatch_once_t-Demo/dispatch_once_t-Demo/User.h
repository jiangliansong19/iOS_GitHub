//
//  User.h
//  dispatch_once_t-Demo
//
//  Created by 江连松 on 2017/6/14.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (nonatomic, strong) NSString *job;
+ (User *)sharedInstance;
- (void)deleteUser;
@end
