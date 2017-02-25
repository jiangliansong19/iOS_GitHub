//
//  ViewController.m
//  OC中的C语言封装
//
//  Created by JLS on 2017/1/9.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"
#import "Object.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Object *obj = nil;
    
    objectRetain(obj);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
