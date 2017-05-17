//
//  CustomQueneViewController.m
//  GCD
//
//  Created by 江连松 on 15/9/1.
//  Copyright (c) 2015年 JLS. All rights reserved.
//

#import "CustomQueneViewController.h"

@interface CustomQueneViewController ()<UIAlertViewDelegate>

@property (nonatomic ,strong) dispatch_queue_t customQuene;
@end

@implementation CustomQueneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _customQuene = dispatch_queue_create("jiangliansong", DISPATCH_QUEUE_CONCURRENT);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//获取主线程
- (IBAction)buttonAction1:(id)sender {
    
    NSLog(@"但前线程－%@",[NSThread currentThread]);
}


//自定义队列异步串行
- (IBAction)buttonAction2:(id)sender {
    
    //自定义队列异步串行－仅仅开启了一条新的线程，串行执行任务
    //        1异步串行<NSThread: 0x7fbe5c114710>{number = 2, name = (null)}
    //        2异步串行<NSThread: 0x7fbe5c114710>{number = 2, name = (null)}
    //        3异步串行<NSThread: 0x7fbe5c114710>{number = 2, name = (null)}
    //        4异步串行<NSThread: 0x7fbe5c114710>{number = 2, name = (null)}
    //        5异步串行<NSThread: 0x7fbe5c114710>{number = 2, name = (null)}
    
    _customQuene = dispatch_queue_create("jiangliansong", DISPATCH_QUEUE_SERIAL);
    dispatch_async(_customQuene, ^{
        NSLog(@"1异步串行%@",[NSThread currentThread]);
    });
    dispatch_async(_customQuene, ^{
        NSLog(@"2异步串行%@",[NSThread currentThread]);
    });
    dispatch_async(_customQuene, ^{
        NSLog(@"3异步串行%@",[NSThread currentThread]);
    });
    dispatch_async(_customQuene, ^{
        NSLog(@"4异步串行%@",[NSThread currentThread]);
    });
    dispatch_async(_customQuene, ^{
        NSLog(@"5异步串行%@",[NSThread currentThread]);
    });
    
}


//自定义队列异步并行
- (IBAction)buttonAction3:(id)sender {
    
    //自定义队列异步并行－根据需要开启多条线程，并行执行任务
    //            2异步并行<NSThread: 0x7ff6e077fa50>{number = 3, name = (null)}
    //            1异步并行<NSThread: 0x7ff6e2820690>{number = 2, name = (null)}
    //            5异步并行<NSThread: 0x7ff6e28230c0>{number = 6, name = (null)}
    //            4异步并行<NSThread: 0x7ff6e051c1e0>{number = 5, name = (null)}
    //            3异步并行<NSThread: 0x7ff6e0447e70>{number = 4, name = (null)}
    
    _customQuene = dispatch_queue_create("jiangliansong", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(_customQuene, ^{
        NSLog(@"1异步并行%@",[NSThread currentThread]);
    });
    dispatch_async(_customQuene, ^{
        NSLog(@"2异步并行%@",[NSThread currentThread]);
    });
    dispatch_async(_customQuene, ^{
        NSLog(@"3异步并行%@",[NSThread currentThread]);
    });
    dispatch_async(_customQuene, ^{
        NSLog(@"4异步并行%@",[NSThread currentThread]);
    });
    dispatch_async(_customQuene, ^{
        NSLog(@"5异步并行%@",[NSThread currentThread]);
    });
}


//自定义队列同步串行
- (IBAction)buttonAction4:(id)sender {
    
    //自定义队列同步串行－不开启新的线程
    //运行结果－<NSThread: 0x7fec3ae28110>{number = 1, name = main}
    _customQuene = dispatch_queue_create("jiangliansong", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(_customQuene, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
}


//自定义队列同步并行
- (IBAction)buttonAction5:(id)sender {
    
    //自定义队列同步并行－不开启新的线程
    //运行结果－<NSThread: 0x7fec3ae28110>{number = 1, name = main}
    _customQuene = dispatch_queue_create("jiangliansong", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(_customQuene, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
}

//block执行完毕后，再执行后边的
- (IBAction)semaphore:(id)sender {
    
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    _customQuene = dispatch_queue_create("jiangliansong", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(_customQuene, ^{
        for (int i=0; i<5; i++) {
            NSLog(@"first %d",i);
        }
        dispatch_semaphore_signal(sem);
    });
    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    for (int i=0; i<5; i++) {
        NSLog(@"second %d",100+i);
    }
    
//    2015-09-17 11:38:39.803 多线程Demo[2351:97594] first 0
//    2015-09-17 11:38:39.804 多线程Demo[2351:97594] first 1
//    2015-09-17 11:38:39.804 多线程Demo[2351:97594] first 2
//    2015-09-17 11:38:39.804 多线程Demo[2351:97594] first 3
//    2015-09-17 11:38:39.804 多线程Demo[2351:97594] first 4
//    2015-09-17 11:38:39.804 多线程Demo[2351:97565] second 100
//    2015-09-17 11:38:39.804 多线程Demo[2351:97565] second 101
//    2015-09-17 11:38:39.805 多线程Demo[2351:97565] second 102
//    2015-09-17 11:38:39.805 多线程Demo[2351:97565] second 103
//    2015-09-17 11:38:39.805 多线程Demo[2351:97565] second 104
}
@end
