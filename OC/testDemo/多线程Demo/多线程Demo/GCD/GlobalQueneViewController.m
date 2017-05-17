//
//  GlobalQueneViewController.m
//  GCD
//
//  Created by 江连松 on 15/9/1.
//  Copyright (c) 2015年 JLS. All rights reserved.
//

#import "GlobalQueneViewController.h"

@interface GlobalQueneViewController ()<UIAlertViewDelegate>

@property (nonatomic ,strong) dispatch_queue_t globalQuene;
@end

@implementation GlobalQueneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//#define DISPATCH_QUEUE_PRIORITY_HIGH 2                    最高优先级
//#define DISPATCH_QUEUE_PRIORITY_DEFAULT 0                 默认优先级
//#define DISPATCH_QUEUE_PRIORITY_LOW (-2)                  低优先级
//#define DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN      后台优先级
    
    
//Global Dispatch Queue 是所有应用程序都能够使用的并行队列 Concurrent Dispatch Queue。
//不用刻意的去创建一个Concurrent 的Queue。只要获得系统的这个即可。
//而且，也只能获取并行队列。
    
    _globalQuene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonAction1:(id)sender {
    
    //当前线程－－主线程
    //运行结果－－<NSThread: 0x7fe00a428af0>{number = 1, name = main}
    NSLog(@"当前队列 = %@",[NSThread currentThread]);
}


- (IBAction)buttonAction2:(id)sender {
    
    //全局异步并行线程
    //运行结果－－<NSThread: 0x7fe00a711e20>{number = 2, name = (null)}
    //开启了一条新的线程
    dispatch_async(_globalQuene, ^{
        NSLog(@"globalQuene1 ＝ %@",[NSThread currentThread]);
    });
    dispatch_async(_globalQuene, ^{
        NSLog(@"globalQuene2 ＝ %@",[NSThread currentThread]);
    });
    dispatch_async(_globalQuene, ^{
        NSLog(@"globalQuene3 ＝ %@",[NSThread currentThread]);
    });
    dispatch_async(_globalQuene, ^{
        NSLog(@"globalQuene4 ＝ %@",[NSThread currentThread]);
    });
    
}
- (IBAction)buttonAction3:(id)sender {
    
    //全局同步并行线程
    //运行结果－<NSThread: 0x7fe00a428af0>{number = 1, name = main}
    //没有开启新的线程，依旧在主线程中串行执行任务
    dispatch_sync(_globalQuene, ^{
        NSLog(@"globalQuene1 ＝ %@",[NSThread currentThread]);
    });
    dispatch_sync(_globalQuene, ^{
        NSLog(@"globalQuene2 ＝ %@",[NSThread currentThread]);
    });
    dispatch_sync(_globalQuene, ^{
        NSLog(@"globalQuene3 ＝ %@",[NSThread currentThread]);
    });
    dispatch_sync(_globalQuene, ^{
        NSLog(@"globalQuene4 ＝ %@",[NSThread currentThread]);
    });
    
}


- (IBAction)buttonAction4:(id)sender
{
    
    dispatch_queue_t queue = dispatch_queue_create("jiang", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        for (int i=0; i<5; i++) {
            NSLog(@"%d",i);
            [NSThread sleepForTimeInterval:1];
        }
    });
    dispatch_async(queue, ^{
        for (int i=20; i<30; i++) {
            NSLog(@"%d",i);
            [NSThread sleepForTimeInterval:1];
        }
    });

    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), queue, ^{
        for (int i=100; i<110; i++) {
            NSLog(@"%d",i);
            [NSThread sleepForTimeInterval:1];
        }
    });
    
//    dispatch_async_f(queue, nil, realFunction1);
//    dispatch_async_f(queue, nil, realFunction2);
//    dispatch_async_f(queue, nil, realFunction3);
}


void realFunction1(void *input){
    NSLog(@"%@",[NSThread currentThread]);
    for(int i = 0;i < 5;i++){
        NSLog(@"%d",i);
        sleep(1);
    }
}

void realFunction2(void *input){
    NSLog(@"%@",[NSThread currentThread]);
    for (int i=20; i<25; i++) {
        NSLog(@"%d",i);
        sleep(1);
    }
}

void realFunction3(void *input){
    NSLog(@"%@",[NSThread currentThread]);
    for (int i=100; i<105; i++) {
        NSLog(@"%d",i);
        [NSThread sleepForTimeInterval:1];
    }
}

- (IBAction)dispatch_group_t:(id)sender {
    
    //创建线程组，group里可以关联多个不同的队列。
    dispatch_group_t group =  dispatch_group_create();
    
    dispatch_queue_t queue1 = dispatch_queue_create("jiangliansong", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue2 = dispatch_queue_create("songlianjiang",DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue3 = dispatch_queue_create("liansongjiang", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_group_async(group, queue1, ^{
        NSLog(@"%@",[NSThread currentThread]);
        //耗时操作
        for (int i=0; i<5; i++) {
            NSLog(@"queue1--%d",10+i);
            sleep(1);
        }
    });
    
    dispatch_group_async(group, queue1, ^{
        NSLog(@"%@",[NSThread currentThread]);
        //耗时操作
        for (int i=0; i<5; i++) {
            NSLog(@"queue1--%d",20+i);
            [NSThread sleepForTimeInterval:1];
        }
    });
    
    dispatch_group_async(group, queue2, ^{
        NSLog(@"%@",[NSThread currentThread]);
        //耗时操作
        for (int i=0; i<5; i++) {
            NSLog(@"queue2--%d",100+i);
            [NSThread sleepForTimeInterval:1];
        }
    });
    
    dispatch_group_async(group, queue2, ^{
        NSLog(@"%@",[NSThread currentThread]);
        //耗时操作
        for (int i=0; i<5; i++) {
            NSLog(@"queue2--%d",200+i);
            [NSThread sleepForTimeInterval:1];
        }
    });
    
//    //等前面与group相关联的任务都执行完毕后，通知group在制定队列，执行新加入的block
//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        NSLog(@"OK");
//    });
    
    //表示一直等待，直到与group相关联的所有任务执行完毕，不能在中途取消等待
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    dispatch_async(queue3, ^{
        NSLog(@"%@",[NSThread currentThread]);
        NSLog(@"OK");
    });
    
    
//    //2秒钟后开始监测，如果有返回结果0，表示执行完毕了。如果没有返回结果0，表示group任务还在执行
//    dispatch_time_t waitTime = dispatch_time(DISPATCH_TIME_NOW, 2*NSEC_PER_SEC);
//    long result = dispatch_group_wait(group, waitTime);
//    if (result == 0) {
//        //group里的所有任务执行完毕后，执行新的任务
//        NSLog(@"OK");
//    }else{
//        //group里的所有任务尚未执行完毕
//        NSLog(@"NO");
//    }
    
}
@end
