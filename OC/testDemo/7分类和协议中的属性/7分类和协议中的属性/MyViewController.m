//
//  MyViewController.m
//  7分类和协议中的属性
//
//  Created by 江连松 on 2017/4/15.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "MyViewController.h"


@protocol MyProtocol <NSObject>
//在 protocol 中使用 property 相当于仅仅生成 setter 和 getter 方法声明,
//我们使用属性的目的,是希望遵守我协议的对象能实现该属性
@property(nonatomic, strong) NSString *name;

- (void)eat;

@optional
- (void)doHousework;

@end


@interface MyViewController ()<MyProtocol>

@end


@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    不能使用name属性，否则奔溃，myViewController是没有name这个属性的
//    self.name = @"jiangliansong";
//    NSLog(@"%@",self.name);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)eat {
    NSLog(@"eat some noodles");
}

- (void)setName:(NSString *)name {
    
}

- (NSString *)name {
    return @"";
}

@end
