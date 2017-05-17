//
//  CarViewController.h
//  CoreData使用
//
//  Created by 江连松 on 2017/5/6.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person+CoreDataClass.h"
#import "Car+CoreDataClass.h"
#import "DataBase.h"

@interface CarViewController : UIViewController

@property (nonatomic, strong) Person *person;

@end
