//
//  AppDelegate.h
//  OC和C++混编
//
//  Created by 江连松 on 2017/5/8.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

