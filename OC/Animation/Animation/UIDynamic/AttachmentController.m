//
//  AttachmentController.m
//  Animation
//
//  Created by 江连松 on 16/1/21.
//  Copyright © 2016年 jls. All rights reserved.
//

#import "AttachmentController.h"

@interface AttachmentController ()
@property (nonatomic ,strong) UIDynamicAnimator *animator;
@end

@implementation AttachmentController

- (void)viewDidLoad {
    [super viewDidLoad];
    //实例化一个物理仿真器，附带一个参考视图
    _animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 附着行为仿真器
- (IBAction)attachment:(id)sender {
    
    [_animator removeAllBehaviors];
    //添加重力仿真行为
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc]initWithItems:@[_ballImageView]];
    [_animator addBehavior:gravityBehavior];
    
    //实例化附着行为仿真器（依附在自由落体的_gravityButton上）
    UIAttachmentBehavior *attachmentBehavior = [[UIAttachmentBehavior alloc]initWithItem:_ballImageView attachedToItem:_ballImageView];
    [_animator addBehavior:attachmentBehavior];
    
    
}

@end
