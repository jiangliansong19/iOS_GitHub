//
//  ViewController.m
//  SVProgressHUD-Demo
//
//  Created by 江连松 on 2017/12/28.
//  Copyright © 2017年 jls. All rights reserved.
//

#import "SPViewController.h"

#import "SVProgressHUD.h"

@interface SPViewController ()

@end

@implementation SPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showHUD:(id)sender {
    
    [SVProgressHUD show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
}

@end
