//
//  ViewController.m
//  LeaksTest
//
//  Created by 江连松 on 2018/11/27.
//  Copyright © 2018年 jls. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerA.h"
#import "CustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat originY = 0.0f;
    for (int i = 0; i < 100000; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.text = [NSString stringWithFormat:@"%d", i];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = UIColor.orangeColor;
        label.backgroundColor = UIColor.lightGrayColor;
        label.frame = CGRectMake(100.f, originY, 100.f, 20.f);
        [self.view addSubview:label];
//
//        label.layer.borderWidth = 0.5f;
//        label.layer.borderColor = UIColor.grayColor.CGColor;
//        label.layer.cornerRadius = 2.f;
//        label.layer.masksToBounds = YES;
        
        originY += 25.f;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
