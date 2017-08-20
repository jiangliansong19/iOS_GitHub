//
//  UIViewController+logic_UI.m
//  logic&&UI-Demo
//
//  Created by 江连松 on 2017/6/18.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "UIViewController+logic_UI.h"
#import "Aspects.h"

@implementation UIViewController (logic_UI)

//+ (void)load {
//    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//
//        [UIViewController aspect_hookSelector:@selector(loadView) withOptions:AspectPositionBefore usingBlock:^{
//        
//            
//        
//        } error:nil];
//        
//        
//        
//    });
//    
//    
//    
//}



+ (void)addSubViewController:(UIViewController *)vc toParentViewController:(UIViewController*)parentVc {
    
    //1.视图添加
    [parentVc addChildViewController:vc];
    vc.view.frame = parentVc.view.frame;
    [parentVc.view addSubview:vc.view];
    [vc didMoveToParentViewController:parentVc];
    
    //2.属性一一对应
    
    
    
    
}

@end
