//
//  DynamicItemController.m
//  Animation
//
//  Created by 江连松 on 16/1/21.
//  Copyright © 2016年 jls. All rights reserved.
//

#import "DynamicItemController.h"

@interface DynamicItemController ()
@property (nonatomic ,strong ) UIDynamicAnimator *animator;
@end

@implementation DynamicItemController

- (void)viewDidLoad {
    [super viewDidLoad];
    //实例化一个物理仿真器，附带一个参考视图
    _animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)dynamicItem:(id)sender {
    
    [_animator removeAllBehaviors];
    UIDynamicItemBehavior *itemBehavior = [[UIDynamicItemBehavior alloc]initWithItems:@[_ballImageView]];
    [itemBehavior addAngularVelocity:1 forItem:_ballImageView];
    [_animator addBehavior:itemBehavior];
    
    
}

@end
