//
//  CounterTest.m
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

@interface CounterTest : XCTestCase
@property (nonatomic, strong) Counter *sut;
@property (nonatomic, strong) NSUserDefaults *mockDefaults;
@end

@implementation CounterTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _mockDefaults = mock([NSUserDefaults class]);
    _sut = [[Counter alloc]initWithUserDefalut:_mockDefaults];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    
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

- (void)testInitShouldNotReturnNil {
    Counter *counter = [[Counter alloc] initWithUserDefalut:[NSUserDefaults standardUserDefaults]];
    assertThat(counter, instanceOf([counter class]));
}

- (void)testGetCountInDefaultsWithNilShouldReturnZero {
    [given([_mockDefaults objectForKey:@"currentID"]) willReturn:nil];
    assertThatInteger([_sut getCountInDefaults], equalToInteger(0));
}

- (void)testGetCountInDefaultsWithNumberThreeShouldReturnIntegerThree {
    [given([_mockDefaults objectForKey:@"currentID"]) willReturn:@3];
    assertThatInteger([_sut getCountInDefaults], equalToInteger(3));
}

@end
