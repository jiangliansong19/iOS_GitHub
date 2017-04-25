//
//  ViewController.m
//  Block
//
//  Created by 江连松 on 2017/4/17.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIColor *bgColor;
@property (nonatomic, strong) void(^bgBlock)(int);
@property (nonatomic, strong) NSNotificationCenter *observer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//

    __WEAK__BLOCK
    self.bgBlock = ^(int index){
        weakSelf.view.backgroundColor = [UIColor colorWithWhite:index%256/255.0 alpha:0.8];
    };
    self.bgBlock(1233);
    
    
    //intA 在定义前是栈区，但只要进入了 block 区域，就变成了堆区。这才是 __block 关键字的真正作用。
    __block int intA = 0;
    void(^intBlock)(int) = ^(int index){
        intA = index;
    };
    intBlock(122);
    
    
    //a 在定义前是栈区，但只要进入了 block 区域，就变成了堆区。这才是 __block 关键字的真正作用。
    __block NSMutableString *a = [NSMutableString stringWithString:@"Tom"];
    NSLog(@"\n 定以前：------------------------------------\n\
          a指向的堆中地址：%p；a在栈中的指针地址：%p", a,&a);
    void (^foo)(void) = ^{
        a.string = @"Jerry";
        NSLog(@"\n block内部：------------------------------------\n\
          a指向的堆中地址：%p；a在栈中的指针地址：%p", a, &a);
        a = [NSMutableString stringWithString:@"William"];
    };
    foo();
    NSLog(@"\n 定以后：------------------------------------\n\
          a指向的堆中地址：%p；a在栈中的指针地址：%p", a, &a);
    
    
    self.observer = [[NSNotificationCenter defaultCenter] addObserverForName:@"notification" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        self.bgColor = [UIColor purpleColor];
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
