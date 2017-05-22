//
//  Counter.m
//  UnitTest-Demo
//
//  Created by 江连松 on 2017/5/21.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "Counter.h"

NSString *const CountInDefaultID = @"countInDefaultID";
NSString *const CounterModelChanged = @"CounterModelChanged";

@implementation Counter

- (id)initWithUserDefalut:(NSUserDefaults *)defaults {
    if (self == [super init]) {
        _defaults = defaults;
        _count = [self getCountInDefaults];
    }
    return  self;
}

- (NSInteger)getCountInDefaults {
    NSNumber *remindId = [_defaults objectForKey:CountInDefaultID];
    return [remindId integerValue] ?: 0;
}

- (void)increment {
    _count = [self getCountInDefaults] + 1;
    [_defaults setObject:@(_count) forKey:CountInDefaultID];
    [[NSNotificationCenter defaultCenter] postNotificationName:CounterModelChanged object:self];
}

- (void)decrement {
    
}

@end
