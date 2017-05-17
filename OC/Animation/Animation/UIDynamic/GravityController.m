//
//  GravityController.m
//  Animation
//
//  Created by 江连松 on 16/1/21.
//  Copyright © 2016年 jls. All rights reserved.
//

#import "GravityController.h"

@interface GravityController ()
@property (nonatomic ,strong) UIDynamicAnimator *animator;

@end

@implementation GravityController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    //实例化一个物理仿真器，附带一个参考视图
    _animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gravity:(id)sender{
    
    
    //移除所有的仿真行为
    [_animator removeAllBehaviors];
    
    //实例化物理仿真行为,附带需要物理仿真的对象
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc]initWithItems:@[_ballImageView]];
    
    //移除某个需要物理仿真的对象
//    [gravityBehavior removeItem:_ballImageView];
    
    //方法一：定义重力的方向矢量－－直坐标系
    //    gravityBehavior.gravityDirection = CGVectorMake(0, 1);
    
    //方法二：定义重力的方向矢量－－弧度坐标系
    [gravityBehavior setAngle:M_PI_2 magnitude:M_SQRT2];
    
    //将重力仿真行为加入到物理仿真器
    [_animator addBehavior:gravityBehavior];
}

@end
