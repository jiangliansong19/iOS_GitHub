//
//  ViewController.m
//  UIPopoverController
//
//  Created by 江连松 on 2017/4/25.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIPopoverController *popover;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonAction:(UIButton *)sender {
    
    UIViewController *VC = [[UIViewController alloc]init];
    VC.view.backgroundColor = [UIColor purpleColor];
    _popover = [[UIPopoverController alloc]initWithContentViewController:VC];
}

@end
