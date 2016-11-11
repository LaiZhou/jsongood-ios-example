//
//  JsonGoodDemoTests.m
//  JsonGoodDemoTests
//
//  Created by lz on 2016/11/8.
//  Copyright © 2016年 jessyz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <UIKit/UIKit.h>
#import<Foundation/Foundation.h>
#import<JsonGood/JsonGood.h>
#import "JSTestParam.h"
@interface JsonGoodDemoTests : XCTestCase

@end

@implementation JsonGoodDemoTests

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
    
    // This is an example of a functional test case.
    XCTestExpectation *expectation =
    [self expectationWithDescription:@"High Expectations"];
    JSRpcManager *manager=[JSRpcManager managerWithGatewayURL:@"http://localhost:8088/api"] ;
    manager.attachments=@{@"rpcVersion":@"1.0.0"};
    manager.customHttpHeaders=@{@"platform":@"ios" ,@"UserAgent":@"iosapp/1.0.0"};
    
    JSTestParam *testParam=[JSTestParam new];
    testParam.intParam=100;
    testParam.doubleParam=0.01;
    testParam.stringParam=@"hello,rapidmob";
    testParam.listParam=@[@"a",@"b"];
    testParam.mapParam=@{@"a":@"1",@"b":@2};
    testParam.date=[NSDate dateWithTimeIntervalSinceNow:0];
    JSTestParam *testParam2=[JSTestParam new];
    testParam2.intParam=102;
    testParam2.doubleParam=0.01;
    testParam2.stringParam=@"hello,rapidmob";
    testParam2.listParam=@[@"a",@"b"];
    testParam2.mapParam=@{@"a":@"1",@"b":@2};
    testParam.param=testParam2;
    
    
    
    [manager invoke:@"com.github.jessyZu.jsongood.demo.api.DemoService:sayHello1:1.0.0" withParameters:@[testParam,testParam2,@[testParam]] success:^(AFHTTPRequestOperation *operation, JSRpcResult *rpcResult) {
        
        NSLog(@"rpcResult: %@", rpcResult);
        if (rpcResult.success&&rpcResult.data) {
            JSTestParam *resultData=[rpcResult dataToObject:[JSTestParam class]];
            NSLog(@"resultData: %@", resultData);
            
        }
        [expectation fulfill];
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error: %@", error);
        
        [expectation fulfill];
        
    }];
    [self waitForExpectationsWithTimeout:60.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
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
