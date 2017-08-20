//
//  Activity.m
//  logic&&UI-Demo
//
//  Created by 江连松 on 2017/6/17.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "Activity.h"
#import "ViewController.h"
#import "UIViewController+logic_UI.h"
#import <objc/message.h>

@interface Activity (){

    UIButton *_loginBtn;
    UITextField *_accountTF;
    UITextField *_passwordTF;
    UILabel *_passwordLabel;
    UILabel *_accountLabel;
}

@end

@implementation Activity

- (void)loadView {
    [super loadView];
    
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
    
    
//    NSBundle *jiang =  [NSBundle bundleWithIdentifier:@"JLS.jiang"];
//    ViewController *vc = [[UIStoryboard storyboardWithName:@"jiang" bundle:jiang] instantiateViewControllerWithIdentifier:@"ViewController"];
    
    
//    NSBundle *ownBundle = [NSBundle bundleForClass:[self class]];
//    NSBundle *bundel = [NSBundle bundleWithURL:[ownBundle URLForResource:@"jiang" withExtension:@"bundle"]];

    
    
    
    
    
    
    
    [UIViewController addSubViewController:vc toParentViewController:self];
    
//    self->_loginBtn = vc.loginBtn;
//    self->_accountLabel = vc.accoutLabel;
//    self->_passwordLabel = vc.passwordLabel;
//    self->_accountTF = vc.accoutTF;
//    self->_passwordTF = vc.passwordTF;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self->_loginBtn addTarget:self action:@selector(loginButtonAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)loginButtonAction {
    
    NSLog(@"login");
}


@end
