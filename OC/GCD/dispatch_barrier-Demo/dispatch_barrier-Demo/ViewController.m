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
- (IBAction)test:(id)sender
{
    __block int a,b;
    dispatch_queue_t queue = dispatch_queue_create(NULL, DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        sleep(3);
        a = 3;
        NSLog(@"a = %d",a);
    });
    dispatch_async(queue, ^{
        sleep(4);
        b = 4;
        NSLog(@"b = %d",b);
    });
    dispatch_barrier_sync(queue, ^{
        NSLog(@"a + b = %d",a+b);
    });
    
}

void add(int a, int b) {
    NSLog(@"a + b = %d",b +b);
}

@end
