//
//  NSThreadViewController.m
//  多线程Demo
//
//  Created by 江连松 on 15/9/1.
//  Copyright (c) 2015年 jls. All rights reserved.
//

#import "NSThreadViewController.h"

@interface NSThreadViewController ()
{
    NSThread *_thread5;
    NSLock *_lock;
    int _sum;
}
@end

@implementation NSThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    FOUNDATION_EXPORT NSNotificationName const NSWillBecomeMultiThreadedNotification;
//    FOUNDATION_EXPORT NSNotificationName const NSDidBecomeSingleThreadedNotification;
//    FOUNDATION_EXPORT NSNotificationName const NSThreadWillExitNotification;
    /**
     *  添加观察者，可以观察线程的结束
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(threadFirst:) name:NSThreadWillExitNotification object:nil];
    
    /**
     *  初始化线程锁对象。两个线程中加的是同一把锁
     */
    _lock = [[NSLock alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - event response

- (IBAction)buttonAction1:(UIButton *)sender {
    
    //第一种创建线程的方法
    //NSObject的方法
    [self performSelectorInBackground:@selector(createThread1) withObject:nil];
}

- (IBAction)buttonAction2:(UIButton *)sender {
    
    //第二种创建线程的方法
    //NSThread的一个类方法
    [NSThread detachNewThreadSelector:@selector(createThread2) toTarget:self withObject:nil];
}

- (IBAction)buttonAction3:(UIButton *)sender {
    
    //创建线程
    //对象方法
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(createThread3) object:nil];
    
    //前两种线程时创建后马上运行，第三种是需要手动开始
    [thread start];
    
    thread.name = @"Name3";
}

- (IBAction)buttonAction4:(UIButton *)sender {
    
    [self performSelectorInBackground:@selector(createThread4) withObject:nil];
}


- (IBAction)buttonAction5:(UIButton *)sender {
    
    _thread5 = [[NSThread alloc]initWithTarget:self selector:@selector(createThread5) object:nil];
    [_thread5 start];
    
}

- (IBAction)buttonAction6:(UIButton *)sender {
    
    [self performSelectorInBackground:@selector(createThread6) withObject:nil];
}

- (IBAction)buttonAction7:(UIButton *)sender {
    
    [self performSelectorInBackground:@selector(createThread7) withObject:nil];
}

#pragma mark - private method
- (void)createThread1
{
    for (int i=0; i<5; i++) {
        NSLog(@"Thread1 = %@",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:1.0f];
    }
    
    //获取当前的线程
    NSThread *currentThread = [NSThread currentThread];
    currentThread.name = @"Name1";
}

- (void)createThread2
{
    for (int i=0; i<5; i++) {
        NSLog(@"Thread2 = %@",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:1.0f];
    }
    
    //取道当前的线程
    NSThread *currentThread = [NSThread currentThread];
    currentThread.name = @"Name2";
}


- (void)createThread3
{
    for (int i=0; i<5; i++) {
        NSLog(@"Thread3 = %@",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:1.0f];
    }
}


- (void)createThread4
{
    for (int i=0; i<5; i++) {
        NSLog(@"Thread4 = %@",[NSThread currentThread]);
        if (i == 5) {
            
            //给thread5发送一个cancel消息，处理不处理由——thread自己决定
            [_thread5 cancel];
        }
        [NSThread sleepForTimeInterval:1.0f];
    }
}

- (void)createThread5
{
    int i=0;
    while (1) {
        NSLog(@"Thread5 = %@",[NSThread currentThread]);
        i++;
        [NSThread sleepForTimeInterval:1.0f];
        
        //判断当前的线程是否收到了Cancell信息
        if ([[NSThread currentThread] isCancelled]) {
            
            NSLog(@"线程5退出");
            [NSThread exit];
        }
        
    }
}

- (void)createThread6
{
    while (true) {
        
        /**
         *  线程锁的使用：
         *  1.将线程锁起来
         *  2.修改变量的值
         *  3.解锁，unlock，以便于另外的线程使用
         */
        [_lock lock];
        for (int i=0; i<5; i++) {
            _sum++;
            NSLog(@"Thread6++sum == %d",_sum);
            [NSThread sleepForTimeInterval:1.0f];
        }
        [_lock unlock];
    }
}


- (void)createThread7
{
    while (true) {
        [_lock lock];
        for (int j=0; j<5; j++) {
            _sum--;
            NSLog(@"Thread7--sum == %d",_sum);
            [NSThread sleepForTimeInterval:2.0f];
        }
        [_lock unlock];
    }
}

- (void)threadFirst:(NSNotification *)notice
{
    NSThread *thread = notice.object;
    NSLog(@"线程结束，thead = %@",thread);
    
    if ([thread.name isEqualToString:@"Name3"]) {
        NSLog(@"线程3结束了");
    }
}

@end
