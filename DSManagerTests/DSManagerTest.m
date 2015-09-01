//
//  DSManagerTest.m
//  DSManager
//
//  Created by Evan on 9/1/15.
//  Copyright (c) 2015 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "DSManager.h"

@interface DSManagerTest : XCTestCase

@end

@implementation DSManagerTest

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
    XCTAssert(YES, @"Pass");
}

-(void)testDSManager {
    
    XCTestExpectation *expectaton = [self expectationWithDescription:@"block should get called"];
    
    DSManager *dsManager = [[DSManager alloc]init];
    
    [dsManager setGet:100 block:^ (int index) {
        XCTAssertEqual(150, index);
        [expectaton fulfill];
    }];
    
    [dsManager setCurrentIndex:150];
    
    [self waitForExpectationsWithTimeout:0.5 handler:^ (NSError *error) {
        
        if (error) {
            XCTFail(@"something");
        }
        
    }];
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
