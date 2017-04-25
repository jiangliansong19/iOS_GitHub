//
//  ViewController.m
//  9Property的关键字
//
//  Created by 江连松 on 2017/4/15.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@protocol WorkerDelegate <NSObject>

@end

@interface ViewController ()

//1.原子性。注意默认是原子性。
@property (nonatomic,strong) NSMutableArray *array;


//2.读写权限---只读。
@property (readonly, strong) NSString *name;
//2.读写权限---读写(默认)
@property (readwrite, strong) NSString *address;


//3.内存管理语义
@property (nonatomic, assign) int age;
@property (nonatomic, strong) NSArray *families;
@property (nonatomic, weak) id<WorkerDelegate>delegate;
@property (nonatomic, copy) NSString *lastName;

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


@end
