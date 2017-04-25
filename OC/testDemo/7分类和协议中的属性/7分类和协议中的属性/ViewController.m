//
//  ViewController.m
//  7分类和协议中的属性
//
//  Created by 江连松 on 2017/4/15.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"
#import "MyViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)buttonAction:(UIButton *)sender {
    [self.navigationController pushViewController:[MyViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
