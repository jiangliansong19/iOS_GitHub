//
//  ViewControllerA.m
//  DataBase
//
//  Created by 江连松 on 2018/11/8.
//  Copyright © 2018年 jls. All rights reserved.
//

#import "ViewControllerA.h"
#import "Student.h"

@interface ViewControllerA ()

@end

@implementation ViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    Student *stu = [Student new];
    stu.studentId = 1;
    stu.name = @"hello-world";
    stu.age = 39;
    stu.phoneNo = @"18712346789";
    stu->_address = @"China HongKong";
    stu->_classId = 12;
    
    NSDictionary *keyvalues = stu.keyvalues;
    NSLog(@"keyvalues = %@",keyvalues);
    
    Student *newStu = [Student modelWithKeyValues:keyvalues];
    NSLog(@"newStu.keyvalues = %@", newStu.keyvalues);
    
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"student.data"];
    BOOL success = [NSKeyedArchiver archiveRootObject:stu toFile:dataPath];
    if (!success) {
        NSLog(@"NSKeyedArchiver failure");
    }
    Student *archiveStu = [NSKeyedUnarchiver unarchiveObjectWithData:[NSData dataWithContentsOfFile:dataPath]];
    NSLog(@"archiveDic.keyvalues = %@", archiveStu.keyvalues);
    
    
    stu.firstName = @"wang";
    NSLog(@"stu.firstName = %@",stu.firstName);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
