//
//  CollisionController.m
//  Animation
//
//  Created by 江连松 on 16/1/21.
//  Copyright © 2016年 jls. All rights reserved.
//

#import "CollisionController.h"

@interface CollisionController ()
@property (nonatomic ,strong) UIDynamicAnimator *animator;
@end

@implementation CollisionController

- (void)viewDidLoad {
    [super viewDidLoad];
    _animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 碰撞行为仿真器
- (IBAction)collision:(id)sender {
    //物理仿真器移除所有动画
    [_animator removeAllBehaviors];
    
    //添加重力仿真行为
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc]initWithItems:@[_ballImgeView]];
    gravityBehavior.gravityDirection = CGVectorMake(0, 1);
    [_animator addBehavior:gravityBehavior];
    
    //添加碰撞仿真行为
    UICollisionBehavior *groundCollisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[_ballImgeView]];
    
    /**
     *  定义碰撞边界
     *  @param fromPoint 碰撞边界的起点
     *  @param toPoint 碰撞边界的终点
     */
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.view.frame)-170, CGRectGetMaxY(self.view.frame)-200, 170, 10)];
    imageView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:imageView];
    CGPoint fromPoint = CGPointMake(imageView.frame.origin.x,imageView.frame.origin.y);
    CGPoint toPoint = CGPointMake(CGRectGetMaxX(imageView.frame),imageView.frame.origin.y);
    [groundCollisionBehavior addBoundaryWithIdentifier:@"ground"
                                             fromPoint:fromPoint
                                               toPoint:toPoint];
    [_animator addBehavior:groundCollisionBehavior];
}

@end
