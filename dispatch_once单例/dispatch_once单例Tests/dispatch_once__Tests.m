//
//  dispatch_once__Tests.m
//  dispatch_once单例Tests
//
//  Created by 高李军 on 15/11/19.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface dispatch_once__Tests : XCTestCase

@end

@implementation dispatch_once__Tests

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
