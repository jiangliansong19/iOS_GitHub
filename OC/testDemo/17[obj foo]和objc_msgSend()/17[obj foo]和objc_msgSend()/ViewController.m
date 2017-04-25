//
//  ViewController.m
//  17[obj foo]和objc_msgSend()
//
//  Created by 江连松 on 2017/4/16.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Q1:有什么办法可以知道方法编号呢
    SEL mothod = @selector(test);
    NSLog(@"mothod == %s", mothod);
    
    //Q2:编号获取后怎么执行对应方法呢
    [self performSelector:mothod];
    
    //Q3:有没有办法通过编号获取方法
    NSString *mothodName = NSStringFromSelector(mothod);
    NSLog(@"mothodName = %@",mothodName);
    
    //Q4:IMP怎么获得和使用
    IMP mothodPointer = [self methodForSelector:mothod];
    mothodPointer();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test {
    NSLog(@"这是测试方法");
}

@end
