//
//  ViewControllerA.m
//  LeaksTest
//
//  Created by 江连松 on 2018/11/27.
//  Copyright © 2018年 jls. All rights reserved.
//

#import "ViewControllerA.h"
#import "CustomView.h"

@interface ViewControllerA ()

@property (nonatomic, strong) NSString *time;;

@end

@implementation ViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];

    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(updateTime)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)updateTime {
    self.time = [NSString stringWithFormat:@"%f", [NSDate date].timeIntervalSince1970];
    NSLog(@"%@ -- %@", NSStringFromClass(self.class), self.time);
}

//- (void)dealloc {
//    [self.timer invalidate];
//    NSLog(@"%s", __func__);
//}
@end
