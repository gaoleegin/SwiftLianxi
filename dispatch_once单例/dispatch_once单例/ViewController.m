//
//  ViewController.m，
//  dispatch_once单例，这个就是股票震荡大结果吗。真的就是这个结果吗
//
//  Created by 高李军 on 15/11/19
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "ViewController.h"
#import "Userfault.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //GCD所调用的类
    //libdispatch.dylib
    [self GCDDemo7];

}


-(void)GCDDemo7{
    
    
    //GCDDemo6 的原型,停在那里无关紧要，都一样，都是一样的
    
    //创建一个队列 异步
    dispatch_queue_t queue = dispatch_queue_create("gaolijun", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_enter(group);
    
    dispatch_async(queue, ^{
        //这个就是异步和同步的区别，可以开启线程
        NSLog(@"hahahahaahha===%@",[NSThread currentThread]);
       dispatch_group_leave(group);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"哈哈哈啊哈哈%@",[NSThread currentThread]);
        
    });
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"执行完毕了==%@",[NSThread currentThread]);
    });
}


//组调度
-(void)GCDDemo6{
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t queue = dispatch_queue_create("gaolijun", DISPATCH_QUEUE_CONCURRENT);;
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"第一组hahahahah===%@",[NSThread currentThread]);
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"第二组hahahahahah-----%@",[NSThread currentThread]);
    });
    
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"任务已经执行完毕");
    });
}






-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //因为是纯C语言的，所以字符串的前边不应该添加@
    //创建一个队列，一个并发队列
    dispatch_queue_t queue = dispatch_queue_create("gaolijun", DISPATCH_QUEUE_CONCURRENT);

    //然后将任务添加在队列中,这个才是真正的任务，就是真正的renwu
    
    for (int i = 0; i<10; i++) {
        dispatch_async(queue, ^{
            NSLog(@"打印结果%@===%d",[NSThread currentThread],i);
        });
        
        NSLog(@"come  here");
    }
    
    //原来是这个样子添加任务，真的就是不懂啊，不懂啊，添加任务,在
}

-(void)GCDDemo4{
    
    //队列是并行队列，任务是异步任务,这个会开启多条线程，然后执行顺序也是乱序的
    
    //创建一个并行队列
    dispatch_queue_t queueu = dispatch_queue_create("gaolijun", DISPATCH_QUEUE_CONCURRENT);
    
    //将任务添加啊到这个并行队列中
    for (int i = 0; i<10; i++) {
        dispatch_async(queueu, ^{
            NSLog(@"%@=====%d",[NSThread currentThread],i);
        });
        
        NSLog(@"come here");//竟然先打印出来的come here
    }
}


-(void)GCDDemo3{
    
    //队列是并行队列，然后同步任务
    
    //创建一个队列，是并行的,同步任务不会开启线程，执行顺序是一个接一个，上一个没有执行完毕，下一个绝对不会执行
    dispatch_queue_t queue = dispatch_queue_create("gaolijun", DISPATCH_QUEUE_CONCURRENT);
    
    //将同步任务添加到这个异步队列中
    for (int i = 0; i<10; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"%@===%d",[NSThread currentThread],i);
        });
        
        NSLog(@"com here");
    }
    
    
    
}

-(void)GCDDemo2{
    //串行队列，异步任务，会开线程，但是里面的任务还是会一个一个的执行
    //创建一个串行队列
    dispatch_queue_t queue = dispatch_queue_create("gaolijun", DISPATCH_QUEUE_SERIAL);
    
    //将异步任务添加到串行队列中
    for (int i = 0; i<10 ; i++) {
        dispatch_async(queue, ^{
            NSLog(@"%@=======%d",[NSThread currentThread], i);
        });
        
        NSLog(@"come here %@",[NSThread currentThread]);
    }
}




//重新整理一哈GCD的基本用法
-(void)GCDDemo1{
    //同步任务，串行队列，串行队列在创建的时候使用到的一个枚举的值DISPATCH_QUEUE_SERIAL
    
    //创建一个并发队列
    dispatch_queue_t queue = dispatch_queue_create("gaolijun", DISPATCH_QUEUE_SERIAL);
    
    //将任务添加到队列里面，将任务添加
    
    for (int i = 0; i< 10; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"%@===%d",[NSThread currentThread],i);
        });
        NSLog(@"come here");
    }
    //总结：串行队列，同步任务；不开启线程，就是在当前线程执行，然后再执行任务的时间按照一定的顺序执行
    //真的
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
