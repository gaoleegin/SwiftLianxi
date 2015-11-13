//
//  _9______blockTests.m
//  09-冒泡排序和blockTests
//
//  Created by 高李军 on 15/11/13.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface _9______blockTests : XCTestCase

@end

@implementation _9______blockTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
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

@end
