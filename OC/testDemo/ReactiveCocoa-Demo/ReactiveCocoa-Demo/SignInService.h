//
//  SignInService.h
//  ReactiveCocoa-Demo
//
//  Created by 江连松 on 2017/6/2.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SignInResponse)(BOOL);

@interface SignInService : NSObject

- (void)signInWithUsername:(NSString*)username
                  password:(NSString*)password
                  complete:(SignInResponse)completeBlock;

@end
