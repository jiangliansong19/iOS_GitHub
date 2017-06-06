//
//  ViewController.m
//  ReactiveCocoa-Demo
//
//  Created by 江连松 on 2017/5/26.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"
#import "RedView.h"
#import "Computer.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *signInButton;

@property (weak, nonatomic) IBOutlet RedView *redView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //链式编程
    //关键：1.block返回值为调用者对象本身。2.参数部分为block的参数
    Computer *obj = [Computer new];
    obj.add(10).add(15);
    
    //==================================================
    
    //订阅textfield的文本变化
    [self accountTFEditing];
    [self passwordTFEditing];
    [self signInButtonClick];
    
    
    //1.创建信号(冷信号)
    RACSignal *singal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        //3.发送信号
        [subscriber sendNext:@"jiangliansong"];
        
        return nil;
    }];
    
    //2.创建订阅者
    [singal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)accountTFEditing {
    [[_accountTF.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
        return value.length >= 6;
    }] subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"account == %@",x);
    }];
}

- (void)passwordTFEditing {
    [[_passwordTF.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
        return value.length >= 6;
    }] subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"password == %@",x);
    }];
}

- (void)signInButtonClick {
    

}

@end
