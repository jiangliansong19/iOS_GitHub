//
//  ViewController.m
//  dispatch_group-Demo
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
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)notify:(id)sender {
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queueA = dispatch_queue_create("jiang", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_async(group, queueA, ^{
        sleep(2);
        NSLog(@"2===queueA");
    });
    dispatch_group_async(group, queueA, ^{
        sleep(4);
        NSLog(@"4===queueA");
    });
    dispatch_queue_t queueB = dispatch_queue_create("lian", DISPATCH_QUEUE_SERIAL);
    dispatch_group_async(group, queueB, ^{
        sleep(3);
        NSLog(@"3===queueB");
    });
    dispatch_group_async(group, queueB, ^{
        sleep(4);
        NSLog(@"4===queueB");
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"所有任务执行完毕");
    });
}

- (IBAction)enterGroup:(id)sender {
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("jiang", DISPATCH_QUEUE_CONCURRENT);
    dispatch_apply(10, queue, ^(size_t n) {
        dispatch_group_enter(group);
        dispatch_group_async(group, queue, ^{
            int i = arc4random()%10;
            sleep(i);
            NSLog(@"%d 沉睡完毕",i);
            dispatch_group_leave(group);
        });
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"所有任务执行完毕");
    });
}

- (IBAction)watiGroup:(id)sender {
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("jiang", DISPATCH_QUEUE_CONCURRENT);
    dispatch_apply(10, queue, ^(size_t n) {
        dispatch_group_enter(group);
        dispatch_group_async(group, queue, ^{
            int i = arc4random()%10;
            sleep(i);
            NSLog(@"%d 沉睡完毕",i);
            dispatch_group_leave(group);
        });
    });
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"所有任务执行完毕");
    });
}

@end
