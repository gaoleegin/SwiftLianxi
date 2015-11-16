//
//  NSObject+CaculatorMaker.m
//  ReactiveCocoa的简单学习
//
//  Created by 高李军 on 15/11/16.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "NSObject+CaculatorMaker.h"

@implementation NSObject (CaculatorMaker)

+(int)caculotors:(void (^)(Caculoter *))caculotors{
    Caculoter *caculoter = [Caculoter new];
    caculotors(caculoter);
    return caculoter.result;
}

@end


@implementation Caculoter

-(Caculoter *(^)(int))add{
    return ^(int num){
        self.result = self.result + num;
        return self;
    };
}

@end