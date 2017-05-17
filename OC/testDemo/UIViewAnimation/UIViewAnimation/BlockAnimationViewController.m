//
//  BlockAnimationViewController.m
//  UIViewAnimation
//
//  Created by 江连松 on 2017/4/26.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "BlockAnimationViewController.h"

@interface BlockAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation BlockAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)buttonAction:(UIButton *)sender {
    sender.frame = CGRectMake(0, 0, 30, 30);
}



- (IBAction)无延迟无选项无回调:(UIButton *)sender {
    [UIView animateWithDuration:2 animations:^{
        self.button.frame = CGRectMake(300, 400, 100, 100);
    }];
}

- (IBAction)有延迟有选项无回调:(id)sender {
    [UIView anima]
}


- (IBAction)有延迟有选项有回调:(id)sender {
    
}

@end
