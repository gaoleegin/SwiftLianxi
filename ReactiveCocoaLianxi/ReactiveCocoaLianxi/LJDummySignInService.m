//
//  LJDummySignInService.m
//  ReactiveCocoaLianxi
//
//  Created by 高李军 on 15/11/17.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "LJDummySignInService.h"

@implementation LJDummySignInService


-(void)signInWithUsername:(NSString *)userName password:(NSString *)password complicate:(LJSinInResponse)completeBlock{
    
    double delayInSecond = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSecond *NSEC_PER_SEC));
    
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        completeBlock(YES);
    });
                                            
                                            
                                            
    
    
    // double delayInSeconds = 2.0;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        BOOL success = [username isEqualToString:@"user"] && [password isEqualToString:@"password"];
//        completeBlock(success);
//    });
    
    
    
    
    //写一段GCD参数的值
    
}


@end
