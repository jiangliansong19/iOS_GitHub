//
//  ViewController.m
//  GCD延时执行-Demo
//
//  Created by 江连松 on 2017/6/14.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //注意延时的时间。
    NSLog(@"start");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 4*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        NSLog(@"end");
    });
    
    dispatch_after_f(dispatch_time(DISPATCH_TIME_NOW, 3*NSEC_PER_SEC), dispatch_get_main_queue(), nil, &goShopping);
    
//    dispatch_async(dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT), ^{
//        NSLog(@"1");
//        [self performSelector:@selector(nslogTwo) withObject:nil afterDelay:0];
//        NSLog(@"3");
//    });
    
    dispatch_sync(dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT), ^{
        NSLog(@"1");
        [self performSelector:@selector(nslogTwo) withObject:nil afterDelay:0];
        NSLog(@"3");
    });
    NSRunLoopCommonModes
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)nslogTwo {
    NSLog(@"2");
}

void goShopping() {
    NSLog(@"Yeah.Let's go shopping!");
}

@end
