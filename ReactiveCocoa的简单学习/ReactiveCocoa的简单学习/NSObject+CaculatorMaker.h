//
//  NSObject+CaculatorMaker.h
//  ReactiveCocoa的简单学习
//
//  Created by 高李军 on 15/11/16.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Caculoter;
@interface NSObject (CaculatorMaker)


+(int)caculotors:(void(^)(Caculoter *maker))caculotors;

@end

@interface Caculoter : NSObject

@property(nonatomic,assign) int result;

-(Caculoter *(^)(int num))add;

@end
