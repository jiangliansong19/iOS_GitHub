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
@property (nonatomic, copy) NSString *name;
@property (atomic, copy) NSString *lastName;
@property (atomic, strong) NSMutableArray *children;
@property (nonatomic, assign) float salary;
@property (nonatomic, weak) id staff;
@end

@implementation Person(name)

- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)name {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLastName:(NSString *)lastName {
    objc_setAssociatedObject(self, @selector(lastName), lastName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)lastName {
    return objc_getAssociatedObject(self, _cmd);
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Person *per = [[Person alloc]init];
        per.age = 20;
        per.name = @"liuhulang";
        per.lastName = @"hulang";
        
        NSLog(@"per.age = %d", per.age);
        NSLog(@"per.name = %@", per.name);
        NSLog(@"per.lastName = %@", per.lastName);
        
        
    }
    return 0;
}
