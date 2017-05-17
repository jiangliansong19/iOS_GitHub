//
//  Greeting.m
//  OC&C++
//
//  Created by 江连松 on 2017/5/12.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "Greeting.h"

@implementation Greeting
- (id)init {
    if (self = [super init]) {
        hello = new Hello();
    }
    return self;
}

- (void)sayGreeting {
    hello->say_hello();
}

- (void)sayGreeting:(Hello*)greeting {
    greeting->say_hello();
}
@end

