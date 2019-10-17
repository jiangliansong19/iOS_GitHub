
//
//  CustomView.m
//  LeaksTest
//
//  Created by 江连松 on 2018/11/27.
//  Copyright © 2018年 jls. All rights reserved.
//

#import "CustomView.h"

@interface CustomView()
{
    void(^_block)(NSInteger);
    NSInteger _clickCount;
}
@end

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 50, 30);
        [button setTitle:@"click" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickMe) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        self.backgroundColor = [UIColor purpleColor];
    }
    return self;
}

- (void)clickMe {
    _clickCount += 1;
    if (_block) {
        _block(_clickCount);
    }
}

- (void)buttonClickCompletion:(void (^)(NSInteger))clickCompletion {
    _block = [clickCompletion copy];
}

@end
