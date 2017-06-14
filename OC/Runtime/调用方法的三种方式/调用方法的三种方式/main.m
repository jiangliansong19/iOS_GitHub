//
//  main.m
//  调用方法的三种方式
//
//  Created by 江连松 on 2017/6/11.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>

@interface Person : NSObject

@end

@implementation Person

- (void)eat {
    NSLog(@"我要吃东西");
}

- (void)drink:(NSString *)drinkName {
    NSLog(@"我要喝--%@",drinkName);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        //方式一：smallTalk语法
        Person *per = [[Person alloc]init];
        [per eat];
        [per drink:@"小名同学"];
        
        //方式二：performSelector
        [per performSelector:@selector(eat)];
        [per performSelector:@selector(drink:) withObject:@"哇哈哈"];
        
        //方式三：底层代码---消息发送msgSend
        //xcode5.0后苹果不推荐使用底层代码发送消息
        //直接写会报错，需要关闭msgSend的严格检测。enabled strict msgSend checking --- NO
        //第一个参数为对象，类也是一个对象。分清楚类对象，元类。
        objc_msgSend(per, @selector(eat));
        objc_msgSend(per, @selector(drink:), @"农夫山泉");
        objc_msgSend(per, sel_registerName("drink:"), @"健力宝");
        
        
        //创建对象
        Person *obj =  objc_msgSend(objc_msgSend(objc_getClass("Person"), sel_registerName("alloc")), sel_registerName("init"));
        objc_msgSend(obj,sel_registerName("drink:"), @"伊利纯牛奶");
        
        //clang使用，查看运行时代码
        //终端   clang -rewrite-objc main.m  后生成main.cpp文件，查看即可。
    }
    return 0;
}


