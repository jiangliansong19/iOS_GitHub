//
//  ViewController.m
//  11@synthesize和@dynamic分别
//
//  Created by 江连松 on 2017/4/15.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"


//@property有两个对应的词，一个是 @synthesize，一个是 @dynamic。如果 @synthesize和 @dynamic都没写，那么默认的就是@syntheszie var = _var;


@interface ViewController ()




@end



@implementation ViewController

//@dynamic 告诉编译器：属性的 setter 与 getter 方法由用户自己实现，不自动生成。
//如果没有声明setter，getter方法，编译时，不会有问题。但调用setter，getter方法就会奔溃的。
@dynamic name;


//@synthesize 的语义是如果你没有手动实现 setter 方法和 getter 方法，那么编译器会自动为你加上这两个方法。
@synthesize firstName;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    调用self.name后，直接奔溃。
//    self.name = @"jiangliansong";
//    NSLog(@"%@",self.name);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
