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
    dispatch_queue_t queueA = dispatch_queue_create("queueA", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_async(group, queueA, ^{
        for (int i=0; i<3; i++) {
            sleep(1);
            NSLog(@"queueA i = %d", i);
        }
    });
    dispatch_group_async(group, queueA, ^{
        for (int j=0; j<3; j++) {
            sleep(1);
            NSLog(@"queueA j = %d", j);
        }
    });
    dispatch_queue_t queueB = dispatch_queue_create("queueB", DISPATCH_QUEUE_SERIAL);
    dispatch_group_async(group, queueB, ^{
        for (int m=0; m<3; m++) {
            sleep(1);
            NSLog(@"queueB m = %d", m);
        }
    });
    dispatch_group_async(group, queueB, ^{
        for (int n=0; n<3; n++) {
            sleep(1);
            NSLog(@"queueB n = %d", n);
        }
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"all finished");
    });
}

- (IBAction)applyTest:(id)sender {
    dispatch_apply(10, dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT), ^(size_t n) {
        NSLog(@"appTest %zu", n);
    });
    NSLog(@"all finished");
}

- (IBAction)enterGroup:(id)sender {
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_apply(10, queue, ^(size_t n) {
        dispatch_group_enter(group);
        dispatch_group_async(group, queue, ^{
            int i = arc4random()%10;
            sleep(i);
            NSLog(@"%zuth thread sleep %d seconds",n,i);
            dispatch_group_leave(group);
        });
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"all finished");
    });
}

- (IBAction)enterGroup2:(id)sender{
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    dispatch_async(dispatch_queue_create("queue1", DISPATCH_QUEUE_CONCURRENT), ^{
        NSLog(@"start task1");
        sleep(2);
        NSLog(@"end task1");
        dispatch_group_leave(group);
    });
    dispatch_group_enter(group);
    dispatch_async(dispatch_queue_create("queue2", DISPATCH_QUEUE_CONCURRENT), ^{
        NSLog(@"start task2");
        sleep(3);
        NSLog(@"end task2");
        dispatch_group_leave(group);
    });
    dispatch_group_enter(group);
    dispatch_async(dispatch_queue_create("queue3", DISPATCH_QUEUE_CONCURRENT), ^{
        NSLog(@"start task3");
        sleep(4);
        NSLog(@"end task3");
        dispatch_group_leave(group);
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"switch to mainQueue");
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
            NSLog(@"%zuth thread sleep %d seconds",n,i);
            dispatch_group_leave(group);
        });
    });
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"all finished");
    });
}

@end
