//
//  ViewController.m
//  Animation
//
//  Created by 江连松 on 16/1/18.
//  Copyright © 2016年 jls. All rights reserved.
//

#import "UIKitAnimationController.h"

@interface UIKitAnimationController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *listTableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation UIKitAnimationController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:_listTableView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    tap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:tap];
    _listTableView.tableFooterView = [[UIView alloc]init];
    _dataArray = [@[@[@"doRightFlip",@"doLeftFlip",@"doTopFilp",@"doBottomFlip"],
                    @[@"rotation"],
                    @[@"doMove"],
                    @[@"doTransform"]]mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataArray[section] count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = _dataArray[indexPath.section][indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [self doRightFlip];
        }else if(indexPath.row == 1){
            [self doLeftFlip];
        }else if(indexPath.row == 2){
            [self doTopFlip];
        }else{
            [self doBottomFlip];
        }
    }
    else if(indexPath.section == 1){
        [self doRotation];
    }else if(indexPath.section == 2){
        [self doMove];
    }else if(indexPath.section == 3){
        [self doTransform];
    }
}

#pragma mark - private method
- (void)dismiss{
    for (UIView *view in self.view.subviews)
    {
        if ([view isKindOfClass:[UIImageView class]]) {
            [view removeFromSuperview];
        }
    }
}

#pragma mark - event response

//动画显示，消失时的曲线
//	UIViewAnimationCurveEaseInOut,      开始和结束减速
//	UIViewAnimationCurveEaseIn,         开始的时候减速
//	UIViewAnimationCurveEaseOut,		结束的时候减速
//	UIViewAnimationCurveLinear          匀速



// 对View设置转场动画方向 有以下枚举方向
//	typedef NS_ENUM(NSInteger, UIViewAnimationTransition) {
//		UIViewAnimationTransitionNone,
//		UIViewAnimationTransitionFlipFromLeft,
//		UIViewAnimationTransitionFlipFromRight,
//		UIViewAnimationTransitionCurlUp,
//		UIViewAnimationTransitionCurlDown,
//	};



/**
 *  朝右翻动
 */
- (void)doRightFlip{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    //设置翻转方向
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
    [UIView setAnimationDelegate: self];
    //动画3秒延迟后，开始执行
//    [UIView setAnimationDelay:3.0];
    [UIView setAnimationDidStopSelector:@selector(nextAction)];
    [UIView commitAnimations];
    
    
}

- (void)nextAction{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self doLeftFlip];
    });
    
}

/**
 *  朝左翻动
 */
- (void)doLeftFlip{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
    [UIView commitAnimations];
}
/**
 *  朝上翻动
 */
- (void)doTopFlip{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
    [UIView commitAnimations];
}
/**
 *  朝下翻动
 */
- (void)doBottomFlip{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
    [UIView commitAnimations];
}
/**
 *  旋转
 */
- (void)doRotation{
    CGAffineTransform transform;
    //#define M_PI        3.14159265358979323846264338327950288   /*pi*/
    transform = CGAffineTransformRotate(self.view.transform,M_PI);
    [UIView beginAnimations:@"rotate" context:nil ];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    [self.view setTransform:transform];
    [UIView commitAnimations];
}
/**
 *  平移
 */
- (void)doMove{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 500, 120, 100)];
    imageView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:imageView];
    [UIView beginAnimations:@"move" context:nil];
    [UIView setAnimationDuration:2];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:2];
    imageView.frame=CGRectMake(100,100, 120,100);
    [UIView commitAnimations];
    
}
/**
 *  大小改变
 */
- (void)doTransform{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 500, 120, 100)];
    imageView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:imageView];
    CGAffineTransform  transform;
    transform = CGAffineTransformScale(imageView.transform,1.2,1.2);
    [UIView beginAnimations:@"scale" context:nil];
    [UIView setAnimationDuration:2];
    [UIView setAnimationDelegate:self];
    [imageView setTransform:transform];
    [UIView commitAnimations];
}

@end
