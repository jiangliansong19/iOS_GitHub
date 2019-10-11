//
//  ViewController.m
//  JsonToModel
//
//  Created by 江连松 on 2019/8/6.
//  Copyright © 2019 jls. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Student *stu = [Student new];
    stu.studentId = 1;
    stu.name = @"hello-world";
    stu.age = 39;
    stu.phoneNo = @"18712346789";
    stu->_address = @"China HongKong";
    stu->_classId = 12;
    
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"student.data"];
    BOOL success = [NSKeyedArchiver archiveRootObject:stu toFile:dataPath];
    if (!success) {
        NSLog(@"NSKeyedArchiver failure");
    }
    Student *archiveStu = [NSKeyedUnarchiver unarchiveObjectWithData:[NSData dataWithContentsOfFile:dataPath]];
    NSLog(@"archiveDic->_address = %@", archiveStu->_address);
    NSLog(@"archiveDic.name = %@", archiveStu.name);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
