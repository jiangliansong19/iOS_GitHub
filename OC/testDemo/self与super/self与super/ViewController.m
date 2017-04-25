//
//  ViewController.m
//  self与super
//
//  Created by 江连松 on 2017/4/18.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //为什么self和super的class一样
    NSLog(@"%@",NSStringFromClass([self class]));//ViewController
    NSLog(@"%@",NSStringFromClass([super class]));//ViewController
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
