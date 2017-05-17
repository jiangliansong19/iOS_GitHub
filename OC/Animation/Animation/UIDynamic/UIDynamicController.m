//
//  UIDynamicController.m
//  Animation
//
//  Created by 江连松 on 16/1/20.
//  Copyright © 2016年 jls. All rights reserved.
//

#import "UIDynamicController.h"


/*相关说明
1.三个概念
（1）谁要进行物理仿真？
　　物理仿真元素（Dynamic Item）
（2）执行怎样的物理仿真效果？怎样的动画效果？
　　物理仿真行为（Dynamic Behavior）
（3）让物理仿真元素执行具体的物理仿真行为
　　物理仿真器（Dynamic Animator）

2.物理仿真元素

注意：
不是任何对象都能做物理仿真元素
不是任何对象都能进行物理仿真

物理仿真元素要素：
任何遵守了UIDynamicItem协议的对象
UIView默认已经遵守了UIDynamicItem协议，因此任何UI控件都能做物理仿真
UICollectionViewLayoutAttributes类默认也遵守UIDynamicItem协议

3.物理仿真行为
（1）UIDynamic提供了以下几种物理仿真行为
UIGravityBehavior：重力行为
UICollisionBehavior：碰撞行为
UISnapBehavior：捕捉行为/迅猛移动弹跳摆动
UIPushBehavior：推动行为
UIAttachmentBehavior：附着行为
UIDynamicItemBehavior：动力元素行为

（2）物理仿真行为须知
上述所有物理仿真行为都继承自UIDynamicBehavior
所有的UIDynamicBehavior都可以独立进行
组合使用多种行为时，可以实现一些比较复杂的效果
*/


@implementation UIDynamicController

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
