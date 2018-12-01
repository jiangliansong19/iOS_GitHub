//
//  ViewControllerA.m
//  LeaksTest
//
//  Created by 江连松 on 2018/11/27.
//  Copyright © 2018年 jls. All rights reserved.
//

#import "ViewControllerA.h"
#import "CustomView.h"

@interface ViewControllerA ()

@end

@implementation ViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    CustomView *view = [[CustomView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
    [self.view addSubview:view];
    [view buttonClickCompletion:^(NSInteger count) {
        self.view.backgroundColor = [UIColor purpleColor];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}
- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
