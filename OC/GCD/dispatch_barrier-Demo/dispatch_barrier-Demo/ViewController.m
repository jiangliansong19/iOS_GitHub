//
//  ViewController.m
//  dispatch_barrier-Demo
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


//案例：a,b，并发，都执行完毕后，开始执行c。可以用group，可以用信号。。还可以用barrier
- (IBAction)testbarrierSync:(id)sender
{
    NSLog(@"start");
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        for (int i=0; i<3; i++) {
            sleep(1);
            NSLog(@"%@---i = %d",[NSThread currentThread], i);
        }
    });
    dispatch_async(queue, ^{
        for (int i=0; i<3; i++) {
            sleep(1);
            NSLog(@"%@---j = %d",[NSThread currentThread], i);
        }
    });
    dispatch_barrier_sync(queue, ^{
        for (int i=0; i<3; i++) {
            sleep(1);
            NSLog(@"%@dispatch_barrier_sync-k = %d",[NSThread currentThread], i);
        }
    });
    NSLog(@"mainQueue");
    dispatch_async(queue, ^{
        for (int i=0; i<3; i++) {
            sleep(1);
            NSLog(@"%@---m = %d",[NSThread currentThread], i);
        }
    });
    dispatch_async(queue, ^{
        for (int i=0; i<3; i++) {
            sleep(1);
            NSLog(@"%@---n = %d",[NSThread currentThread], i);
        }
    });
}

- (IBAction)testbarrierAsync:(id)sender
{
    NSLog(@"start");
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        for (int i=0; i<3; i++) {
            sleep(1);
            NSLog(@"%@---i = %d",[NSThread currentThread], i);
        }
    });
    dispatch_async(queue, ^{
        for (int i=0; i<3; i++) {
            sleep(1);
            NSLog(@"%@---j = %d",[NSThread currentThread], i);
        }
    });
    dispatch_barrier_async(queue, ^{
        for (int i=0; i<3; i++) {
            sleep(1);
            NSLog(@"%@dispatch_barrier_async-k = %d",[NSThread currentThread], i);
        }
    });
    NSLog(@"mainQueue");
    dispatch_async(queue, ^{
        for (int i=0; i<3; i++) {
            sleep(1);
            NSLog(@"%@---m = %d",[NSThread currentThread], i);
        }
    });
    dispatch_async(queue, ^{
        for (int i=0; i<3; i++) {
            sleep(1);
            NSLog(@"%@---n = %d",[NSThread currentThread], i);
        }
    });
    
}

@end
