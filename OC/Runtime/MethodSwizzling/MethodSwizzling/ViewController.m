//
//  ViewController.m
//  MethodSwizzling
//
//  Created by 江连松 on 2017/6/13.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"
#import "SonViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)presentNext:(UITapGestureRecognizer *)sender {
    [self.navigationController pushViewController:[SonViewController new] animated:YES];
}

@end
