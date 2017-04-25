//
//  ViewController.m
//  GCD
//
//  Created by 江连松 on 2017/4/20.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


void showString() {
    NSLog(@"hello world");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dispatch_async_f(dispatch_get_global_queue(0, 0), nil, &showString);
    dispatch_async_f(dispatch_get_global_queue(0, 0), nil, &showString);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)groupQueue:(UIButton *)sender {
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_queue_create("jiang", DISPATCH_QUEUE_CONCURRENT), ^{
        for (int i=0; i<10; i++) {
            NSLog(@"jiang %d",i);
            sleep(1);
        }
    });
    dispatch_group_async(group, dispatch_queue_create("lian", DISPATCH_QUEUE_CONCURRENT), ^{
        for (int i=0; i<5; i++) {
            NSLog(@"lian %d",i);
            sleep(1);
        }
    });
//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        for (int i=0; i<3; i++) {
//            NSLog(@"song %d",i);
//            sleep(1);
//        }
//    });
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    dispatch_async(dispatch_get_main_queue(), ^{
        for (int i=0; i<4; i++) {
            NSLog(@"song %d", i);
            sleep(1);
        }
    });
    
}

- (IBAction)barrierQueue:(id)sender {
    dispatch_queue_t queue = dispatch_queue_create("jiang", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        for (int i=0; i<5; i++) {
            NSLog(@"jiang%d", i);
            sleep(1);
        }
    });
    dispatch_async(queue, ^{
        for (int i=0; i<10; i++) {
            NSLog(@"lian%d",i);
            sleep(1);
        }
    });
    dispatch_barrier_async(queue, ^{
        for (int i=0; i<9; i++) {
            NSLog(@"song%d",i);
            sleep(1);
        }
    });
    dispatch_async(queue, ^{
        for (int i=0; i<10; i++) {
            NSLog(@"xiao%d",i);
            sleep(1);
        }
    });
    dispatch_async(queue, ^{
        for (int i=0; i<10; i++) {
            NSLog(@"bai%d",i);
            sleep(1);
        }
    });
}
- (IBAction)dispatch_after:(id)sender {
    
    dispatch_queue_t myQueue = dispatch_queue_create("jiang", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(myQueue, ^{
        for (int i=0; i<10; i++) {
            NSLog(@"first====%d",i);
            sleep(1);
        }
    });
    dispatch_async(myQueue, ^{
        for (int i=0; i<5; i++) {
            NSLog(@"second====%d",i);
            sleep(1);
        }
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), myQueue, ^{
        for (int i=0; i<4; i++) {
            NSLog(@"main=====%d", i);
            sleep(1);
        }
    });
}

- (IBAction)dispatch_apply:(id)sender {
    NSArray *array = @[@"jiang",@"lian",@"song",@"xiao",@"bai"];
    dispatch_apply(array.count, dispatch_get_global_queue(0, 0), ^(size_t index) {
        NSLog(@"==%zu",index);
        sleep(2);
    });
    NSLog(@"完成");
}

@end
