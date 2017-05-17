//
//  PushController.m
//  Animation
//
//  Created by 江连松 on 16/1/21.
//  Copyright © 2016年 jls. All rights reserved.
//

#import "PushController.h"

@interface PushController ()
@property (nonatomic ,strong) UIDynamicAnimator *animator;
@end

@implementation PushController

- (void)viewDidLoad {
    [super viewDidLoad];
    //实例化一个物理仿真器，附带一个参考视图
    _animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 推动行为仿真器

- (IBAction)push:(id)sender{
    [_animator removeAllBehaviors];
    //方式一：实例化推动行为仿真器（瞬时力模式）
    //抛射方向＋重力方向＝抛射自由落体运动
    UIPushBehavior *pushBehavior = [[UIPushBehavior alloc]initWithItems:@[_ballImageView] mode:UIPushBehaviorModeInstantaneous];
    
    //方式二：实例化推动行为仿真器（持续力模式）
    //抛射力矢量方向＋重力方向＝物体直线运动方向
//    UIPushBehavior *pushBehavior = [[UIPushBehavior alloc]initWithItems:@[_ballImageView] mode:UIPushBehaviorModeContinuous];
    
    //方法一：推动力的矢量方向（直角坐标系）
    pushBehavior.pushDirection = CGVectorMake(0.5, 0);
    //方法二：推动力的矢量方向（弧度坐标系）
    //    [pushBehavior setAngle:M_PI/2 magnitude:2];
    
    //默认物体的推动力受力点－－－{0,0}
    UIOffset offset = [pushBehavior targetOffsetFromCenterForItem:_ballImageView];
    NSLog(@"%@",NSStringFromUIOffset(offset));//{0,0}
    
    //重新设置物体的推动力受力点
    [pushBehavior setTargetOffsetFromCenter:UIOffsetMake(-_ballImageView.frame.size.width/2, 0) forItem:_ballImageView];
    
    //添加推动行为到仿真器
    [_animator addBehavior:pushBehavior];
    
    
    //添加重力仿真行为到仿真器
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc]initWithItems:@[_ballImageView]];
    gravityBehavior.gravityDirection = CGVectorMake(0, 0.2);
    [_animator addBehavior:gravityBehavior];
    
    
    //添加撞击仿真行为到仿真器
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc]initWithItems:@[_ballImageView]];
    [collisionBehavior addBoundaryWithIdentifier:@"right" fromPoint:CGPointMake(KSCreenWidth, 0) toPoint:CGPointMake(KSCreenWidth, KSCreenHeight)];
    [collisionBehavior addBoundaryWithIdentifier:@"botton" fromPoint:CGPointMake(0, KSCreenHeight) toPoint:CGPointMake(KSCreenWidth, KSCreenHeight)];
    [_animator addBehavior:collisionBehavior];
    

}

@end
