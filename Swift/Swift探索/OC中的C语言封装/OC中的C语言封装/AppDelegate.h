//
//  AppDelegate.h
//  OC中的C语言封装
//
//  Created by JLS on 2017/1/9.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

