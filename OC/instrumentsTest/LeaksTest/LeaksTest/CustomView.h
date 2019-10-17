//
//  CustomView.h
//  LeaksTest
//
//  Created by 江连松 on 2018/11/27.
//  Copyright © 2018年 jls. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView

- (void)buttonClickCompletion:(void(^)(NSInteger))clickCompletion;

@end
