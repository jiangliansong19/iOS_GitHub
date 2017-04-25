//
//  AlertView.m
//  KVO
//
//  Created by 江连松 on 2017/4/17.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "AlertView.h"

@implementation AlertView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.helloWorld.textColor = [UIColor redColor];
    }
    return self;
}

@end
