//
//  ViewController.m
//  UnitTest-Demo
//
//  Created by 江连松 on 2017/5/21.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *array1 = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray *array2 = [NSMutableArray arrayWithCapacity:0];
    
    [array1 addObject:array2];
    [array2 addObject:array1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
