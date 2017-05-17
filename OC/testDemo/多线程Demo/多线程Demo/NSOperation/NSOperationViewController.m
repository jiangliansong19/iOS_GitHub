//
//  NSOperationViewController.m
//  多线程Demo
//
//  Created by 江连松 on 15/9/1.
//  Copyright (c) 2015年 jls. All rights reserved.
//

#import "NSOperationViewController.h"
#import "DownLoadOperation.h"

#define ImageUrlArray @[@"http://e.hiphotos.baidu.com/image/pic/item/ac345982b2b7d0a27005c318c9ef76094a369a63.jpg",@"http://a.hiphotos.baidu.com/image/pic/item/b151f8198618367ac2adb9582c738bd4b31ce50b.jpg",@"http://d.hiphotos.baidu.com/image/pic/item/377adab44aed2e7390cd40a98501a18b87d6fa0b.jpg",@"http://b.hiphotos.baidu.com/image/pic/item/b2de9c82d158ccbff5488e341bd8bc3eb03541c3.jpg"]

#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height


@interface NSOperationViewController ()<UIAlertViewDelegate>
@property (nonatomic, strong) NSOperationQueue *quene;
@end

@implementation NSOperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSOperationQueue有两种不同类型的队列:主队列和自定义队列.
//    
//    主队列运行在主线程上,自定义队列在后台执行.
//    
//    队列处理的任务是NSOperation的子类:NSInvocationOperation 和 NSBlockOperation.
    
    _quene = [[NSOperationQueue alloc] init];
    
    //NSOperation特有：设置系统允许的最大线程数，保证开的线程数目，不会造成线程太多，浪费系统资源。
    _quene.maxConcurrentOperationCount = 3;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 主线程
//主线程
- (IBAction)buttonAction1:(id)sender {
    
    NSOperationQueue *mainQuene = [NSOperationQueue mainQueue];
    //主队列中添加的NSOperation一定在主队列
    [mainQuene addOperationWithBlock:^{
        NSLog(@"mainQuene = %@",[NSThread currentThread]);
    }];
    
}


#pragma mark - NSInvocationOperation
//第一种。NSInvocationOperation，子线程中添加的NSOperation一定在子线程中执行
- (IBAction)buttonAction2:(id)sender {
    
    //开启多条线程
    NSInvocationOperation *invocation1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(NSInvocationOperation1) object:nil];
    NSInvocationOperation *invocation2 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(NSInvocationOperation2) object:nil];
    NSInvocationOperation *invocation3 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(NSInvocationOperation3) object:nil];
    NSInvocationOperation *invocation4 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(NSInvocationOperation4) object:nil];
    NSInvocationOperation *invocation5 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(NSInvocationOperation5) object:nil];
    
    //Operation必须放到NSOperationQuene中才能运行
#warning Operation一加入到NSOperationQuene中就运行，所以先进先执行，这个说法错误。应该是在同一个线程中，先进先出。而不是一个队列。队列就是任务池，在任务池中，不能确定执行的先后。只有，加入了线程，在能确定先进先出。
    //Operation已加入quene立即运行，与NSThread区分开
    //同时开启线程条数为，设置的最大线程数
    
    
    //依赖关系：可以保证执行顺序，也使得开的子线程不会太多
    [invocation2 addDependency:invocation1];
    [invocation3 addDependency:invocation2];
    [invocation4 addDependency:invocation3];
    [invocation5 addDependency:invocation4];
    
    [_quene addOperation:invocation1];
    [_quene addOperation:invocation2];
    [_quene addOperation:invocation3];
    [_quene addOperation:invocation4];
    
    //可以跨队列，如最后一条线程在主队列中执行，而GCD，NSThread串行线程是不可以跨队列的。
    [[NSOperationQueue mainQueue] addOperation:invocation5];
    
    //运行结果
    //NSInvocationOperation1 = <NSThread: 0x7fe00940cd70>{number = 2, name = (null)}
    //NSInvocationOperation2 = <NSThread: 0x7fe00940cd70>{number = 2, name = (null)}
    //NSInvocationOperation3 = <NSThread: 0x7fe00940cd70>{number = 2, name = (null)}
    //NSInvocationOperation4 = <NSThread: 0x7fe00940cd70>{number = 2, name = (null)}
    //NSInvocationOperation5 = <NSThread: 0x7fe009515590>{number = 1, name = main}

}

#pragma mark - NSBlockOperation
- (IBAction)buttonAction3:(id)sender {

    //每个block开启了一条线程，block中任务是在该线程中，串行执行
    NSBlockOperation *blockOperation1 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i=0; i<6; i++){
            NSLog(@"blockOperation1 － %@",[NSThread currentThread]);
            [NSThread sleepForTimeInterval:1.0];
        }
    }];
    NSBlockOperation *blockOperation2 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i=0; i<6; i++){
            NSLog(@"blockOperation2 － %@",[NSThread currentThread]);
            [NSThread sleepForTimeInterval:1.0];
        }
    }];
    
    //特点：添加依赖关系。只有block1执行完了，才会执行block2.
    //由于1执行完了，该线程被释放了。所以开始2的时候，依旧只开了第一条子线程。
    [blockOperation2 addDependency:blockOperation1];
    
    //开启了两条并行的线程
    [_quene addOperation:blockOperation1];
    [_quene addOperation:blockOperation2];
    
    
    //不添加依赖关系－－－运行结果
    //blockOperation2 － <NSThread: 0x7fe761d04fb0>{number = 2, name = (null)}
    //blockOperation1 － <NSThread: 0x7fe761ca4950>{number = 3, name = (null)}
    //blockOperation2 － <NSThread: 0x7fe761d04fb0>{number = 2, name = (null)}
    //blockOperation1 － <NSThread: 0x7fe761ca4950>{number = 3, name = (null)}
    //blockOperation1 － <NSThread: 0x7fe761ca4950>{number = 3, name = (null)}
    //blockOperation2 － <NSThread: 0x7fe761d04fb0>{number = 2, name = (null)}
    //blockOperation1 － <NSThread: 0x7fe761ca4950>{number = 3, name = (null)}
    //blockOperation2 － <NSThread: 0x7fe761d04fb0>{number = 2, name = (null)}
    //blockOperation1 － <NSThread: 0x7fe761ca4950>{number = 3, name = (null)}
    //blockOperation2 － <NSThread: 0x7fe761d04fb0>{number = 2, name = (null)}
    //blockOperation1 － <NSThread: 0x7fe761ca4950>{number = 3, name = (null)}
    //blockOperation2 － <NSThread: 0x7fe761d04fb0>{number = 2, name = (null)}
    
    //添加依赖关系－－－运行结果
    //blockOperation1 － <NSThread: 0x7fa0c3cb54f0>{number = 2, name = (null)}
    //blockOperation1 － <NSThread: 0x7fa0c3cb54f0>{number = 2, name = (null)}
    //blockOperation1 － <NSThread: 0x7fa0c3cb54f0>{number = 2, name = (null)}
    //blockOperation1 － <NSThread: 0x7fa0c3cb54f0>{number = 2, name = (null)}
    //blockOperation1 － <NSThread: 0x7fa0c3cb54f0>{number = 2, name = (null)}
    //blockOperation1 － <NSThread: 0x7fa0c3cb54f0>{number = 2, name = (null)}
    //blockOperation2 － <NSThread: 0x7fa0c3cb54f0>{number = 2, name = (null)}
    //blockOperation2 － <NSThread: 0x7fa0c3cb54f0>{number = 2, name = (null)}
    //blockOperation2 － <NSThread: 0x7fa0c3cb54f0>{number = 2, name = (null)}
    //blockOperation2 － <NSThread: 0x7fa0c3cb54f0>{number = 2, name = (null)}
    //blockOperation2 － <NSThread: 0x7fa0c3cb54f0>{number = 2, name = (null)}
    //blockOperation2 － <NSThread: 0x7fa0c3cb54f0>{number = 2, name = (null)}
}

#pragma mark - NSCustomOperation
- (IBAction)buttonAction4:(id)sender {
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture)];
    [self.view addGestureRecognizer:tap];
    for (UIButton *button in self.view.subviews) {
        if ([button isKindOfClass:[UIButton class]]) {
            button.userInteractionEnabled = NO;
        }
    }
    
    //开启4条线程
    for (int i=0; i<2; i++) {
        for (int j=0; j<2; j++) {
            
            DownLoadOperation *downloadOperation = [[DownLoadOperation alloc]initWithUrl:ImageUrlArray[i] andCompletionBlock:^(DownLoadOperation *operation, NSData *data) {
                NSLog(@"下载图片%d - %@",i*2+j,[NSThread currentThread]);
                UIImage *image = [[UIImage alloc]initWithData:data];
                
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(KScreenWidth/4*(j*2)+10, (KScreenHeight-64)/4*(i*2)+70, KScreenWidth/2-20, KScreenHeight/2-50)];
                [self.view addSubview:imageView];
                imageView.image = image;
                
            }];
            
            [_quene addOperation:downloadOperation];
        }
        
    }
    //运行结果
    //DownLoadOperation1 - <NSThread: 0x7fef09f68970>{number = 4, name = (null)}
    //DownLoadOperation0 - <NSThread: 0x7fef09dddb20>{number = 3, name = (null)}
    //DownLoadOperation2 - <NSThread: 0x7fef0c00ec10>{number = 5, name = (null)}
    //DownLoadOperation3 - <NSThread: 0x7fef09d156b0>{number = 6, name = (null)}
    
}



#pragma mark - event response

- (void)NSInvocationOperation1
{
    [NSThread sleepForTimeInterval:1.0];
    NSLog(@"NSInvocationOperation1 = %@",[NSThread currentThread]);
}
- (void)NSInvocationOperation2
{
    [NSThread sleepForTimeInterval:1.0];
    NSLog(@"NSInvocationOperation2 = %@",[NSThread currentThread]);
}
- (void)NSInvocationOperation3
{
    [NSThread sleepForTimeInterval:1.0];
    NSLog(@"NSInvocationOperation3 = %@",[NSThread currentThread]);
}
- (void)NSInvocationOperation4
{
    [NSThread sleepForTimeInterval:1.0];
    NSLog(@"NSInvocationOperation4 = %@",[NSThread currentThread]);
}
- (void)NSInvocationOperation5
{
    [NSThread sleepForTimeInterval:1.0];
    NSLog(@"NSInvocationOperation5 = %@",[NSThread currentThread]);
}

- (void)tapGesture
{
    for (UIView *imageView in self.view.subviews)
    {
        if ([imageView isKindOfClass:[UIImageView class]]) {
            [imageView removeFromSuperview];
        }
    }
    for (UIButton *button in self.view.subviews) {
        if ([button isKindOfClass:[UIButton class]]) {
            button.userInteractionEnabled = YES;
        }
    }
}
@end
