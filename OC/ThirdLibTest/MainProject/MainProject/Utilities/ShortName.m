//
//  ShortName.m
//  MainProject
//
//  Created by 江连松 on 2017/12/20.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ShortName.h"


__kindof UIViewController *InstantiateViewController(NSString *storyboardName,NSString*identifier) {
    UIViewController *result;
    @try {
        result = [[UIStoryboard storyboardWithName:storyboardName bundle:nil] instantiateViewControllerWithIdentifier:identifier];
    } @catch (NSException *exception) {
        NSLog(@"InstantiateViewController --- %@",exception);
    } @finally {
        return result;
    }
}

UIColor *RGB(int red,int green,int blue) {
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}
