//
//  main.m
//  交换方法的实现
//
//  Created by 江连松 on 2017/6/12.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>

@interface Person : NSObject

- (void)eat:(NSString *)food;
- (void)drink:(NSString *)drink;

@end

@implementation Person

- (void)eat:(NSString *)food {
    NSLog(@"%s -- 大口吃%@",__FUNCTION__,food);
}
- (void)drink:(NSString *)drink {
    NSLog(@"%s -- 大口喝%@",__FUNCTION__,drink);
}

@end

@interface Student : NSObject

- (void)play:(NSString *)game;
- (void)write:(NSString *)homework;

@end

@implementation Student

- (void)play:(NSString *)game {
    NSLog(@"%s -- 玩%@",__FUNCTION__,game);
}
- (void)write:(NSString *)homework {
    NSLog(@"%s -- 做%@",__FUNCTION__,homework);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    
        //交换方法的实现部分。eat和drink互换实现部分
        Method eat = class_getInstanceMethod([Person class], sel_registerName("eat:"));
        Method drink = class_getInstanceMethod([Person class], sel_registerName("drink:"));
        method_exchangeImplementations(eat, drink);
        
        //替换方法的实现部分。eat被替换成play
        Method play = class_getInstanceMethod([Student class], sel_registerName("play:"));
        class_replaceMethod([Person class], sel_registerName("eat:"), method_getImplementation(play), "v@");
        
        
        Person *per = [[Person alloc]init];
        [per eat:@"超级汉堡"];
        [per drink:@"焦糖咖啡"];
                                              
    }
    return 0;
}
