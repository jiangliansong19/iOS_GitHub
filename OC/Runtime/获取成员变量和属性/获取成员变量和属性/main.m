//
//  main.m
//  获取成员变量和属性
//
//  Created by 江连松 on 2017/6/12.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>
#import "NSObject+JSONModel.h"

@interface Person : NSObject
{
    @public
    int age;
    NSString *firstName;
}

//property的底层实现原理？？(set,get,ivar)
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, assign) double money;

@end

@implementation Person

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        //字典转模型
        NSDictionary *dic = @{@"age":@18,@"firstName":@"jiang",@"lastName":@"liansong",@"money":@20000};
        Person *per = [Person modelWithKeyValues:dic];
        NSLog(@"%@\n%f\n%d\n%@\n",per.lastName,per.money,per->age,per->firstName);
        
        //模型转字典
        NSLog(@"%@",per.keyValues);
    }
    return 0;
}




