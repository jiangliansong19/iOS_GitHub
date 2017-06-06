//
//  ViewControllerA.m
//  runtime
//
//  Created by 江连松 on 2017/4/22.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewControllerA.h"
#import <objc/runtime.h>

@interface ViewControllerA ()

@end

@implementation ViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    NSLog(@"%p === ",@selector(printfSELAddress));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)printfSELAddress {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
