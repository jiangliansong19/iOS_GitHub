//
//  UnitTestDemoTests.m
//  UnitTestDemoTests
//
//  Created by 江连松 on 2017/4/12.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface UnitTestDemoTests : XCTestCase

@end

@implementation UnitTestDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    
    NSLog(@"自定义测试testExample");
    int  a = 0;
    XCTAssertTrue(a == 0,"a 不能等于 0");
    
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
