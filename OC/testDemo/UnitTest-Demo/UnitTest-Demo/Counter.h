//
//  Counter.h
//  UnitTest-Demo
//
//  Created by 江连松 on 2017/5/21.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const CounterModelChanged;

@interface Counter : NSObject

@property (nonatomic) NSInteger count;

@property (nonatomic) NSUserDefaults *defaults;

- (id)initWithUserDefalut:(NSUserDefaults *)defaults;

- (void)increment;

- (void)decrement;

- (NSInteger)getCountInDefaults;

@end
