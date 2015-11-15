//
//  DataModelTests.m
//  App主流框架的搭建
//
//  Created by 高李军 on 15/11/15.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "DataModelTests.h"
#import "DataModel.h"

@implementation DataModelTests

- (void)testModelDefaultId
{
    DataModel *model = [[DataModel alloc]init];
    XCTAssertEqual(model.myId, 100, @"The default id should be 100");
}

/**
 *  单元测试的使用，就是这个样子的
 */
-(void)testModelDefaultIDD{
    DataModel *model1 = [[DataModel alloc]init];
    DataModel *model2 = model1;
    
    
    XCTAssertEqualObjects(model1,model2);
    
}



@end
