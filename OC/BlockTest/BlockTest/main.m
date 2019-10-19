//
//  main.m
//  BlockTest
//
//  Created by 江连松 on 2019/10/17.
//  Copyright © 2019 jls. All rights reserved.
//

#import <Foundation/Foundation.h>

int global_num = 33;
NSArray *global_array;

static int static_global_num = 33;
static NSArray *static_global_array;

void testBlock() {

    int num = 33;
    __strong NSObject *Object = [NSObject new];


    static int static_num = 44;
    static NSObject *static_NSObject;

    void(^block)(int) = ^(int i){
        NSLog(@"int num = %d", num);
        NSLog(@"NSArray *Object = %@", Object);

        NSLog(@"static int count = %d", static_num);
        NSLog(@"NSArray *static_NSObject = %@", static_NSObject);

        NSLog(@"int global_num = %d", global_num);
        NSLog(@"NSArray *global_array = %@", global_array);

        NSLog(@"static int static_global_num = %d", static_global_num);
        NSLog(@"static NSArray *static_global_array = %@", static_global_array);
    };
    Object = nil;

    static_NSObject = [NSObject new];
    block(2);
}

void testBlock1() {

    static NSArray *array;
    void(^block)(int) = ^(int i){
        NSLog(@"array = %@", array);
    };
    array = @[@"1111"];
    block(2);
}

void(^result)(int);
void testBlock2() {
    
    
    __block int num = 3;
    void(^block)(int) = ^(int i){
        NSLog(@"i * num = %d", num * i);
    };
    result = [block copy];
    num = 5;
    result(2);
}

void testBlock3() {

    int num = 3;
    void(^block)(int) = ^(int i){
        NSLog(@"i * num = %d", num * i);
    };
    num = 5;
    block(2);
}

void testBlock4() {

    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    void(^block)(int) = ^(int i){
        [array addObject:@(i)];
    };
    block(2);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        testBlock2();
    }
    return 0;
}
