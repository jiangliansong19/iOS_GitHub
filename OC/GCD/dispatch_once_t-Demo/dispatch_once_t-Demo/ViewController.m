//
//  ViewController.m
//  dispatch_once_t-Demo
//
//  Created by 江连松 on 2017/6/14.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"
#import "User.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [User sharedInstance].job = @"iOS开发工程师";
    NSLog(@"%@====%@",[User sharedInstance],[User sharedInstance].job);
    
    //问题来了。。。如何将单例数据清空。(比如切换用户，当前的user需要清空数据）
    //1.将所有的单例属性从新赋值，变相的将其初始化。
    //2.修改onceToken。。
    [[User sharedInstance] deleteUser];
    NSLog(@"%@====%@",[User sharedInstance],[User sharedInstance].job);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
