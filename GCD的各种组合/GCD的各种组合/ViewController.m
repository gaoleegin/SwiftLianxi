//
//  ViewController.m
//  GCD的各种组合
//
//  Created by 高李军 on 15/11/19.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "ViewController.h"
#import "Pthread.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self GCDDemo2];
}


-(void)GCDDemo2{
    
    //队列的种类：串行队列，并发队列，全局队列，主队列
    //任务分为：同步任务，异步任务
    
    //Pthreads
    
    pthread_t thread;
    pthread_create(&thread, NULL, start, NULL);
    
    
}

void *start(void *data){

    NSLog(@"%@",[NSThread currentThread]);
    
    return NULL;
}

-(void)GCDDemo7{
    
    //并发队列，异步任务
    
    //创建一个并发队列
    dispatch_queue_t queue = dispatch_queue_create("com.damai.cn", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        
        for (int i = 0; i<100; i++) {
            NSLog(@"%@==%d",[NSThread currentThread],i);
        }
        
        NSLog(@"come hear%@",[NSThread currentThread]);
        
    });
}

-(void)GCDDemo6{
    //并发队列，同步任务，不会开启线程，任务还是会按照一定的顺序进行执行
    
    //创造一个并发队列 CONCURRENT:同时的
    dispatch_queue_t queue = dispatch_queue_create("com.damai.cn", DISPATCH_QUEUE_CONCURRENT);
    //将一些任务添加到这个并发队列里面
    dispatch_sync(queue, ^{
        for (int i =0; i<10; i++) {
            NSLog(@"%@===%d",[NSThread currentThread],i);
        }
    });
    
    NSLog(@"come   here===%@",[NSThread currentThread]);
}

-(void)CGDDemo5{
    //串行队列，异步任务,会开启线程，就是会按照一定的顺序进行操作，必须得等到上一个任务执行完毕，才会进行下一个操作。
    //创建一个队列
    dispatch_queue_t queue = dispatch_queue_create("com.damai.cn", DISPATCH_QUEUE_SERIAL);
    
    //在这个队列里面添加任务
    dispatch_async(queue, ^{
        
        for (int i = 0; i< 10; i++) {
            NSLog(@"%@==%d",[NSThread currentThread],i);
        }
        
        NSLog(@"come here %@",[NSThread currentThread]);
        
    });
}



-(void)GCDDemo4{
    //串行队列，同步任务,首先不会开启线程,而且所有的任务都是按照一定的顺序进行执行，不会出现混乱的线程
    
    // 创建一个串行队列
    dispatch_queue_t queue = dispatch_queue_create("com.damai.cn", DISPATCH_QUEUE_SERIAL);
    
    //这句代码的意思就是将下面的任务放在这个串行队列里面
    dispatch_sync(queue, ^{
        
        for(int i = 0 ;i<100;i++){
            NSLog(@"%@==%d",[NSThread currentThread],i);
        }
        
        NSLog(@"come here%@",[NSThread currentThread]);
    });
    
    NSLog(@"game over %@",[NSThread currentThread]);

}




/**
 *  GCD的最常用的组合
 */
-(void)GCDDemo1{
    
    //调取全局队列，全局队列时并发队列，然后异步执行任务
    //然后回到主线程，进行UI的刷新.异步时多线程的代名词
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        for (int i =0; i<10; i++) {
            NSLog(@"外面的 %@",[NSThread currentThread]);
        }
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"刷新UI控件%@",[NSThread currentThread]);
        });
        NSLog(@"哈哈哈啊啊哈哈%@",[NSThread currentThread]);
        
    });
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
