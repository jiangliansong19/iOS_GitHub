//
//  ViewController.m
//  dispatch_apply-Demo
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
    
    
    //案例：可以如下，有多个相似的耗时任务需要执行，所有任务执行完毕后，再执行汇总任务。
    dispatch_async(dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL), ^{
        //1.dispatch_apply会阻塞它所在的线程
        //2.dispatch_apply它的block可以在串行队列，或者并行队列中执行。
        dispatch_apply(5, dispatch_get_global_queue(0, 0), ^(size_t n) {
            for (int i=0; i<3; i++) {
                sleep(1);
                NSLog(@"%@ -- %d -- %zu",[NSThread currentThread], i, n);
            }
        });
        NSLog(@"all finished");
    });

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
