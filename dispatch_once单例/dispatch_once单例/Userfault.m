//
//  Userfault.m
//  dispatch_once单例
//
//  Created by 高李军 on 15/11/19.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "Userfault.h"

@implementation Userfault

//单例就是在全局中只初始化一次

+(instancetype)shareUserDefault{
  
    static id instance;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}
//第二种方法，加上互斥🔒
+(instancetype)sharesSyncChroies{
    
    static id instance;
    
    //加上互斥锁，仅仅是为了线程的安全
    @synchronized(self) {
        if (instance==nil) {
            instance = [[self alloc]init];
        }
    }

    return instance;
}

//dispatch_once 是保证里面的代码知识执行一次，就是的，即使执行一次，

/**
 *  GCD的全称是 Grand Central dispatch（牛逼的中枢调度）
    GCD是苹果公司为多核处理器并发计算提供的一种解决方案
    GCD可以自动的管理线程的生命周期（线程的创建，线程对任务的调度，线程的销毁）
    GCD有两个核心的概念；任务和队列
 */







@end
