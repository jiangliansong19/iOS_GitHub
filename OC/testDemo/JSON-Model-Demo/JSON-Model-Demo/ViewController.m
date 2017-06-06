//
//  ViewController.m
//  JSON-Model-Demo
//
//  Created by 江连松 on 2017/6/1.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+ToJSON.h"
#import "NSObject+ToString.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary *dic = @{@"name":@"jiangliansong",@"address":@"China",@"age":@"10"};
    Person *p = [Person modelWithJSON:dic];
    p.age += 2;
    NSLog(@"%@----%@-----%d",p.name,p.address,p.age);
    
    NSLog(@"=====%@",p.keyValues);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
