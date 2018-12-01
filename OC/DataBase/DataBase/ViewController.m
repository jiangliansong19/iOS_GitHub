//
//  ViewController.m
//  DataBase
//
//  Created by 江连松 on 2018/11/2.
//  Copyright © 2018年 jls. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerA.h"
#import "Student.h"

@interface ViewController ()
@property(nonatomic, strong) Student *stu;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@",NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES));

    _stu = [Student new];
    _stu.studentId = 1;
    _stu.name = @"hello-world";
    _stu.age = 29;
    _stu.phoneNo = @"18712346789";
    _stu->_address = @"China HongKong";
    _stu->_classId = 12;
    
    NSLog(@"_stu.keyvalues = %@", _stu.keyvalues);
    
    Student *newStu = [Student modelWithKeyValues:_stu.keyvalues];
    NSLog(@"newStu.keyvalues = %@", newStu.keyvalues);
    
    [self plistTest];
    [self userDefaultTest];
    [self nscodingTest];
    [self fmdbTest];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)nextPageClick:(UIButton *)sender {
    [self.navigationController pushViewController:[ViewControllerA new] animated:YES];
}

- (void)plistTest {
    //plist存储
    NSString *plistPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"student.plist"];
    [_stu.keyvalues writeToFile:plistPath atomically:YES];
    NSDictionary *plistDic = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    NSLog(@"plistDic = %@", plistDic);
}

- (void)userDefaultTest {
    //NSUserDefaults
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:_stu.keyvalues forKey:@"student"];
    [def synchronize];
    NSDictionary *defDic = [def objectForKey:@"student"];
    NSLog(@"defDic = %@", defDic);
}

- (void)nscodingTest {
    //NSKeyedArchiver & NSKeyedUnarchiver
    NSString *dataPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"student.data"];
    [NSKeyedArchiver archiveRootObject:_stu toFile:dataPath];
    NSDictionary *archiveDic = [[NSKeyedUnarchiver unarchiveObjectWithData:[NSData dataWithContentsOfFile:dataPath]] keyvalues];
    NSLog(@"archiveDic = %@", archiveDic);
}

- (void)fmdbTest {
    //FMDB
    //创建路径，常见Database
    NSString *dbPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"user.db"];
    FMDatabase *database = [FMDatabase databaseWithPath:dbPath];
    if (![database open]) {
        NSLog(@"student.db open failure");
    }
    //创建table
    NSString *sql = @"create table if not exists 'student' ('studentId' INTEGER PRIMARY KEY AUTOINCREMENT, 'name' VARCHAR(255) NOT NULL, 'age' INT NOT NULL, 'phoneNo' VARCHAR(100) NOT NULL);";
    if ([database executeUpdate:sql]) {
        NSLog(@"student table crate success");
    }
    //insert 插入
    NSString *insertSql = @"insert into 'student'('studentId','name','age','phoneNo') values (0, '0', 0, '0');";
    if ([database executeUpdate:insertSql]) {
        NSLog(@"insert success");
    }
    //delete 删除
    NSString *deleteSql = @"delete from student where studentId=?;";
    if ([database executeUpdate:deleteSql withArgumentsInArray:@[@0]]) {
        NSLog(@"deleteSuccess");
    }
    //update 改
    NSString *updateSql = @"update student set name=? where studentId=?;";
    if ([database executeUpdate:updateSql withArgumentsInArray:@[@"jiangdawang",@2]]) {
        NSLog(@"update success");
    }
    //select 查询
    NSString *findSql = @"select * from student;";
    FMResultSet *students = [database executeQuery:findSql];
    while ([students next]) {
        NSLog(@"findSuccess: %d",[students intForColumn:@"studentId"]);
    }
    
    [database close];
}

@end
