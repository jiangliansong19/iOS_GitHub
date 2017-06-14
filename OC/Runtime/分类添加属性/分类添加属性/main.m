//
//  main.m
//  分类添加属性
//
//  Created by 江连松 on 2017/6/13.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface Person : NSObject
@property (nonatomic, assign) int age;
@end

@implementation Person
@end

@interface Person(Name)
@property (nonatomic, strong) NSString *name;
@end

@implementation Person(name)

- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_RETAIN);
}

- (NSString *)name {
    return objc_getAssociatedObject(self, _cmd);
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Person *per = [[Person alloc]init];
        per.age = 20;
        per.name = @"jiangliansong";
        NSLog(@"%@ is %d old",per.name, per.age);
    
    }
    return 0;
}
