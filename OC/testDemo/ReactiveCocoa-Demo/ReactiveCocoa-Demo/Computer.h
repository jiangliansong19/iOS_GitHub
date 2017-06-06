//
//  Computer.h
//  ReactiveCocoa-Demo
//
//  Created by 江连松 on 2017/6/2.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Computer : NSObject

- (Computer * (^)(int))add;

@end
