//
//  SoundsTools.m
//  单利
//
//  Created by 高李军 on 16/1/9.
//  Copyright © 2016年 高李军. All rights reserved.
//

#import "SoundsTools.h"

@implementation SoundsTools

static id instance;


// 保证对象只被分配一次内存空间，通过dispatch_once能够保证单例的分配和初始化是线程安全的
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}

// 保证对象只被初始化一次
+ (instancetype)sharedSoundTools {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

//+(instancetype)allocWithZone:(struct _NSZone *)zone{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        instance = [super allocWithZone:zone];
//    });
//    return instance;
//}
//
//
//+(instancetype)sharedSoundsTools{
//    
//    static dispatch_once_t onceToken;
//    
//    dispatch_once(&onceToken, ^{
//        instance = [[self alloc]init];
//    });
//    
//    return instance;
//}



@end
