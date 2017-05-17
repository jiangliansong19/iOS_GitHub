//
//  MainQueneViewController.m
//  GCD
//
//  Created by 江连松 on 15/9/1.
//  Copyright (c) 2015年 JLS. All rights reserved.
//

#import "MainQueneViewController.h"

@interface MainQueneViewController ()<UIAlertViewDelegate>
@property (nonatomic, strong) dispatch_queue_t mainQuene;
@end

@implementation MainQueneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//    主队列:每一个应用程序都对应唯一一个主队列,直接GET即可,在多线程开发中,使用主队列更新UI;
//    
//    注意:
//    
//    1.主队列中的操作都应该在主线程上顺序执行,不存在异步的概念.
//    
//    2.如果把主线程中的操作看作是一个大的Block,那么除非主线程被用户杀掉,否则永远不会结束.所以主队列中添加的同步操作永远不会被执行,会死锁.
    
    _mainQuene = dispatch_get_main_queue();
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//当前主线程,整个程序唯一。只能串行。
- (IBAction)buttonAction1:(id)sender {
    
    NSLog(@"mainQuene ＝ %@",[NSThread currentThread]);
    
}
- (IBAction)buttonAction2:(id)sender {
    
    //主线程异步串行-－－－－-仅此一种运行方式
    //运行结果<NSThread: 0x7f8649c11890>{number = 1, name = main}
    dispatch_async(_mainQuene, ^{
//        NSLog(@"%@",[NSThread currentThread]);
        NSLog(@"%@",dispatch_get_current_queue());
    });
}


//主线程同步串行
#warning 直接锁死
- (IBAction)buttonAction3:(id)sender {
    
    dispatch_sync(_mainQuene, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
    
}


@end
