//
//  ViewControllerA.m
//  Animation
//
//  Created by 江连松 on 16/1/19.
//  Copyright © 2016年 jls. All rights reserved.
//

#import "CoreAnimationController.h"
#import <CoreImage/CoreImage.h>

@interface CoreAnimationController ()

@property (nonatomic ,strong ) CALayer *layer;

@end

@implementation CoreAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
    _layer = [[CALayer alloc]init];
    _layer.cornerRadius = 10;
    _layer.frame = CGRectMake(100, self.view.frame.size.height-300, 100, 100);
    _layer.borderWidth = 2.0;
    _layer.backgroundColor = [[UIColor orangeColor]colorWithAlphaComponent:0.5].CGColor;
    _layer.borderColor = [UIColor blueColor].CGColor;
    _layer.anchorPoint = CGPointZero;
    [self.view.layer addSublayer:_layer];
    */
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    [self.view addGestureRecognizer:tap];
    tap.numberOfTapsRequired = 2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - private method
- (void)dismiss{
    NSLog(@"%@==%ld",self.view.layer.sublayers,self.view.layer.sublayers.count);
}

- (IBAction)basicAnimation:(id)sender {

    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = @(1.0);
    scaleAnimation.toValue = @(1.5);
    
    scaleAnimation.repeatCount = 10;
    scaleAnimation.autoreverses = YES;
    
    [_basicAnimationButton.layer addAnimation:scaleAnimation forKey:@"animation"];
}

/*
 kCAFillModeRemoved   // 这个是默认值,也就是说当动画开始前和动画结束后,动画对layer都没有影响,动画结束后,layer会恢复到之前的状态
 
 kCAFillModeForwards  //当动画结束后,layer会一直保持着动画最后的状态
 
 kCAFillModeBackwards //这个和kCAFillModeForwards是相对的,就是在动画开始前,你只要将动画加入了一个layer,layer便立即进入动画的初始状态并等待动画开始.你可以这样设定测试代码,将一个动画加入一个layer的时候延迟5秒执行.然后就会发现在动画没有开始的时候,只要动画被加入了layer,layer便处于动画初始状态
 
 kCAFillModeBoth      //理解了上面两个,这个就很好理解了,这个其实就是上面两个的合成.动画加入后开始之前,layer便处于动画初始状态,动画结束后layer保持动画最后的状态.
 
 */

//CAAnimationGroup
- (IBAction)groupAnimation:(id)sender{
    [_layer removeAllAnimations];
    
    //平移
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    animation1.toValue = @(0); //改变的值(y增加100)
    
    //旋转
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation2.toValue = @(M_PI_2*3); //旋转90度
    
    //缩放
    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation3.toValue = @(0); //缩放系数变成0
    
    CAAnimationGroup *groupAnimation = [[CAAnimationGroup alloc]init];
    groupAnimation.animations = @[animation1,animation2,animation3];
    groupAnimation.repeatCount = 2;
    groupAnimation.autoreverses = YES;
    groupAnimation.repeatCount = 3;
    //groupAnimation.repeatDuration = 8;//不要和repeatCount一起使用
    groupAnimation.fillMode = kCAFillModeRemoved;
    groupAnimation.speed = 0.1;
    
    [_groupAnimationButton.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
}


/*
 动画类型type的值:
 
     fade = 1,                   //淡入淡出
     push,                       //推挤
     reveal,                     //揭开
     moveIn,                     //覆盖
 //==================以下为隐藏接口==================
     cube,                       //立方体
     suckEffect,                 //吮吸---不用设置@“subtype”
     oglFlip,                    //翻转
     rippleEffect,               //波纹
     pageCurl,                   //翻页
     pageUnCurl,                 //反翻页
     cameraIrisHollowOpen,       //开镜头
     cameraIrisHollowClose,      //关镜头
     curlDown,                   //下翻页
     curlUp,                     //上翻页
     flipFromLeft,               //左翻转
     flipFromRight,              //右翻转
 */

/*
 动画方向subtype的值:
 
 kCATransitionFromRight
 kCATransitionFromLeft
 kCATransitionFromTop
 kCATransitionFromBottom
 */

- (IBAction)catransition:(id)sender{
    CATransition *transition = [CATransition animation];
    transition.type = @"cube";
    transition.subtype = kCATransitionFromBottom;
    transition.duration = 0.3;
    
    CIFilter* filter = [CIFilter filterWithName:@"cube"];
    
//    [filter setValue:[NSValue valueWithCGPoint:CGPointMake(160, 240)] forKey:@"inputPosition"];
    
    transition.filter = filter;
    
    [_transitionButton.layer addAnimation:transition forKey:@"CATransition"];
}
@end
