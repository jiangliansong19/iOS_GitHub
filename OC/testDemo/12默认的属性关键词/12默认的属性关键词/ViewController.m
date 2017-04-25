//
//  ViewController.m
//  12默认的属性关键词
//
//  Created by 江连松 on 2017/4/15.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//对于普通的 Objective-C 对象 atomic,readwrite,strong
@property NSString *name;


//对应基本数据类型默认关键字是 atomic,readwrite,assign
@property int age;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.name = @"jiangliansong";
    NSLog(@"%@",self.name);
    
    self.age = 100;
    NSLog(@"%d",self.age);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
