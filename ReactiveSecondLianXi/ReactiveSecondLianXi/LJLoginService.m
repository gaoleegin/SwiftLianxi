//
//  LJLoginService.m
//  ReactiveSecondLianXi
//
//  Created by 高李军 on 15/11/18.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "LJLoginService.h"

@implementation LJLoginService

-(void)sigInWithuserNam:(NSString *)userName password:(NSString *)password complete:(completeBlock)compleBlock{
    BOOL success = [userName isEqualToString:@"user"] &&[password isEqualToString:@"1"];
    compleBlock(success);
}


@end
