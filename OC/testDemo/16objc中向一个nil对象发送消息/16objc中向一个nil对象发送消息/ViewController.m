//
//  ViewController.m
//  16objc中向一个nil对象发送消息
//
//  Created by 江连松 on 2017/4/15.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *name = nil;
    NSLog(@"%@",[name stringByReplacingOccurrencesOfString:@" " withString:@"b"]);// (null)
    
    //在 Objective-C 中向 nil 发送消息是完全有效的——只是在运行时不会有任何作用
    Student *stu = nil;
    NSLog(@"stu %@", stu); // stu (null)
    NSLog(@"吃了 %@", [stu eat]); //吃了 (null)
    NSLog(@"跑了 %d", [stu run]); //跑了 0
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
