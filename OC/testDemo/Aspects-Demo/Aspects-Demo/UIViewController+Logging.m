//
//  UIViewController+Logging.m
//  Aspects-Demo
//
//  Created by 江连松 on 2017/5/29.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "UIViewController+Logging.h"

#import "Aspects.h"

@implementation UIViewController (Logging)

+ (void)load {
    [super load];
    
    [self aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(){
        NSLog(@"jaha");
    }error:nil];
}

@end
