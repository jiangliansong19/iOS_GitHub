//
//  CounterTest2.m
//  UnitTest-Demo
//
//  Created by 江连松 on 2017/5/21.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <GHUnit.h>
#import <OCMockito.h>
#import <OCHamcrest.h>


#import "Counter.h"

@interface CounterTest2 : XCTestCase
@property (nonatomic, strong) Counter *sut;
@property (nonatomic, strong) NSUserDefaults *mockDefaults;
@property (nonatomic, assign) int modelChangedCount;
@property (nonatomic, assign) NSInteger modelChangedValue;
@end

@implementation CounterTest2

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _mockDefaults = mock([NSUserDefaults class]);
    _sut = [[Counter alloc]initWithUserDefalut:_mockDefaults];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(countModelChanged:) name:CounterModelChanged object:nil];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    _sut = nil;
    
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)countModelChanged:(NSNotification *)notice {
    ++_modelChangedCount;
    Counter *counter = (Counter *)[notice object];
    _modelChangedValue = [counter count];
}

- (void)testIncrementShouldInvokeSetObject {
    [given([_mockDefaults objectForKey:@"currentId"]) willReturn:@3];
    [_sut increment];
    [verify(_mockDefaults) setObject:@4 forKey:@"currentId"];
}

- (void)testIncrementShouldPostNotification {
    [given([_mockDefaults objectForKey:@"currentId"]) willReturn:@3];
    [_sut increment];
    assertThatInt(_modelChangedCount, is(equalToInt(1)));
    assertThatInteger(_modelChangedValue, is(equalToInteger(4)));
}
@end
