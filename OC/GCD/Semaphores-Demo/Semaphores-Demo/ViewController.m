//
//  ViewController.m
//  Semaphores-Demo
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

- (IBAction)test:(id)sender
{
    [UIView animateWithDuration:5 animations:^{
        self.view.backgroundColor = [UIColor orangeColor];
    }];
    
    //注意，信号量机制会阻塞main线程。
    dispatch_queue_t queue = dispatch_queue_create("jiang", DISPATCH_QUEUE_CONCURRENT);
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    dispatch_async(queue, ^{
        sleep(4);
        NSLog(@"沉睡完毕");
        dispatch_semaphore_signal(sem);
    });
    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"任务执行完毕");
    });
}
@end
