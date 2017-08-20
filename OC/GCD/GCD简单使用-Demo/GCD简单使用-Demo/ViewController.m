//
//  ViewController.m
//  GCD简单使用-Demo
//
//  Created by 江连松 on 2017/6/14.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"
#import <os/lock.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //创建并行异步的线程。global_queue默认为并发。。
    dispatch_queue_t global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(global, ^{
        for (int i=0; i<5; i++) {
            NSLog(@"global-i===%d",i);
            sleep(1);
        }
    });
    dispatch_async(global, ^{
        for (int j=0; j<5; j++) {
            NSLog(@"global-j===%d",j);
            sleep(1);
        }
    });
    
    //创建异步串行队列
    dispatch_queue_t myQueue = dispatch_queue_create("jiang", DISPATCH_QUEUE_SERIAL);
    dispatch_async(myQueue, ^{
        for (int i=0; i<5; i++) {
            NSLog(@"jiang-i===%d",i);
            sleep(1);
        }
    });
    dispatch_async(myQueue, ^{
        for (int j=0; j<5; j++) {
            NSLog(@"jiang-j===%d",j);
            sleep(1);
        }
    });

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
