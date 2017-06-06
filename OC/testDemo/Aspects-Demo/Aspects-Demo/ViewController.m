//
//  ViewController.m
//  Aspects-Demo
//
//  Created by 江连松 on 2017/5/29.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor redColor];

    NSString *urlStr = @"https://www.baidu.com/哈哈";
    NSURL *url = [NSURL URLWithString:urlStr];
    
    
    NSArray *array = @[@"jiang",@"lian",@"song"];
    NSString *name = [array objectAtIndex:3];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.view.backgroundColor = [UIColor blueColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
