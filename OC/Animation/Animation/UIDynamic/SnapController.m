//
//  SnapController.m
//  Animation
//
//  Created by 江连松 on 16/1/21.
//  Copyright © 2016年 jls. All rights reserved.
//

#import "SnapController.h"

@interface SnapController ()
@property (nonatomic ,strong) UIDynamicAnimator *animator;
@end

@implementation SnapController

- (void)viewDidLoad {
    [super viewDidLoad];
    //实例化一个物理仿真器，附带一个参考视图
    _animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (IBAction)snap:(id)sender
{
    [_animator removeAllBehaviors];
    UISnapBehavior *snapBehavior = [[UISnapBehavior alloc]initWithItem:_ballImgeView snapToPoint:CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMaxY(self.view.frame)-100)];
    snapBehavior.damping = 0.5f;//瞬间弹跳的剧烈程度，damping为阻尼值：阻尼是对振动结构所耗散的能量的测量，通常用振动一次的能量耗散率来表示结构阻尼的强弱。
    [_animator addBehavior:snapBehavior];
}

@end
