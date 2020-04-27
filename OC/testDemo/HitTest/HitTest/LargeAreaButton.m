//
//  LargeAreaButton.m
//  HitTest
//
//  Created by 江连松 on 2020/4/8.
//  Copyright © 2020 jls. All rights reserved.
//

#import "LargeAreaButton.h"

@implementation LargeAreaButton

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    float x = point.x;
    float y = point.y;
    
    if (y > -10.0 && y - self.frame.size.height < 10.0 &&
        x > -10.0 && y - self.frame.size.width < 10.0) {
        return YES;
    }
    
    return NO;
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//
//
//}

@end
