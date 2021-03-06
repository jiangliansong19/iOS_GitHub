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

    [self testInGlobalQueue];
}

- (void)testSyncInMainQueue {
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"%@", NSStringFromSelector(_cmd));
    });
}

- (void)testInGlobalQueue {
    
    //创建并行异步的线程。global_queue默认为并发。。
    dispatch_queue_t global = dispatch_get_global_queue(0, 0);
    dispatch_sync(global, ^{
        for (int i=0; i<5; i++) {
            NSLog(@"global-i===%d",i);
            sleep(1);
        }
    });
    dispatch_sync(global, ^{
        for (int j=0; j<5; j++) {
            NSLog(@"global-j===%d",j);
            sleep(1);
        }
    });
}

- (void)testAsyncInSerialQueue {
    
    //创建异步串行队列
    dispatch_queue_t myQueue = dispatch_queue_create("jiang", DISPATCH_QUEUE_SERIAL);
    dispatch_async(myQueue, ^{
        for (int i=0; i<5; i++) {
            NSLog(@"jiang-i===%d---%@",i,[NSThread currentThread]);
            sleep(1);
        }
    });
    dispatch_async(myQueue, ^{
        for (int j=0; j<5; j++) {
            NSLog(@"jiang-j===%d---%@",j,[NSThread currentThread]);
            sleep(1);
        }
    });
}

- (void)testAsyncInConcurrentQueue {
    
    //创建异步串行队列
    dispatch_queue_t myQueue = dispatch_queue_create("jiang", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(myQueue, ^{
        for (int i=0; i<5; i++) {
            NSLog(@"jiang-i===%d---%@",i,[NSThread currentThread]);
            sleep(1);
        }
    });
    dispatch_async(myQueue, ^{
        for (int j=0; j<5; j++) {
            NSLog(@"jiang-j===%d---%@",j,[NSThread currentThread]);
            sleep(1);
        }
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
