//
//  ViewController.m
//  OSSpinLock-Demo
//
//  Created by 江连松 on 2017/6/13.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"
#import <os/lock.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    static os_unfair_lock lock = OS_UNFAIR_LOCK_INIT;
    os_unfair_lock_lock(&lock);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i=0; i<5; i++) {
            NSLog(@"%d",i);
            sleep(1);
        }
    });
    os_unfair_lock_unlock(&lock);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"view will appear");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
