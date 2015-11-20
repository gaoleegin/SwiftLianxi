//
//  ViewController.m
//  GCD的深入理解
//  就是这个样子的，就是主线程和主队列
//  Created by 高李军 on 15/11/19.
//  Copyright © 2015年 高李军. All rights reserved.zia
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //队列，全局队列
    
    
    
    //串行队列：
    
    /** 特点：以先进先出的顺序，顺序的调度队列中的任务执行
     *  无论队列中所指定的函数是同步还是异步，都会等到前一个任务执行完成，才会执行后面的任务
     * 可以制定任务的同步还是异步
     */
    
    //并发队列，
    //特点：当前任务是同步的，会在当前线程执行完毕才会执行下面的县城
    //如果当前任务是异步的，就会从底层的线程池进行调度，
    
    
    //开不开线程🈶执行任务的函数执行
    //开几条线程🈶队列执行，串行队列最多开一条，串行队列有底层的线程池决定，线程不是开的越多越好，iOS7.0在开线程的时间最多开67条线程，congiOS8.0开始GCD能开出很多的线程，苹果在讲多线程  NSOperation是封装了GCD，NSOperation可以控制线程的并发数量
    //用C语言的显得高大上
    
    //主队列的异步和同步
    //
    dispatch_get_main_queue();
    
    //主队列只是一个队列，只是在主线程上面调度任务的，主队列也是先进先出，主线程上面空闲的时候，才会在主线程上面执行，队列因为相互等待，不能调用队列的任务 ，主线程和主队列线糊等待，就会造成相互相互死锁。同步也是非常有用的东西，同步死锁的状态
    
    //回顾队列的特点，一直在看输出，主队列的特点
    //专门用来在主线程上面调度任务，就是在主线程空闲的时间调度任务，往主队列上面添加了一个异步任务
    
    //同步任务不执行完，就不会调度UISwitch，JAVA有一个垃圾回收机制，我们有一个家，一个很大的家，我自带了这件事情起那集 琼期间瓶子
    

    
    
    //[self CGDDemo3];
    
}

-(void)CGDDemo77{
    
}

-(void)GCDDemo6{
    //主队列：随着程序的启动已经创建好了
    //队列
    //主线程在休眠，即使是在休眠，等到主线程休息的时间才会
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_async(queue, ^{
        NSLog(@"");
        
    });
    
    
    
}

//CONCURRENT:并发的，同时发生事情

-(void)CGDDemo3{
    
    //并发队列，同步任务，只要就是同步，就是一只等到前面的人物执行，才可以执行后
    
    dispatch_queue_t queue = dispatch_queue_create("itheima.con", DISPATCH_QUEUE_CONCURRENT);
    
    //并发队列，异步执行，
    dispatch_async(queue, ^{
        
        for (int i =0; i<100; i++) {
            
            NSLog(@"%@====%d",[NSThread currentThread],i);
        }
        NSLog(@"里面gameovre%@",[NSThread currentThread]);
    });
    
    NSLog(@" game ovre");
    
    //全局队列
    
    //保证某一个代码只被执行一次
    
    static dispatch_once_t onceToken;
    
    
    //如果token＝＝0；就执行，static就行了，就是保存在静态去，这段代码是同步的，对象本身是线程安全的
    
//    dispatch_once 内部也有一把锁，这把锁的行呢g
    
    dispatch_once(&onceToken, ^{
        NSLog(@"是执行一次吗");
    });
    
    //栈区地址最大，栈区
    //堆区。所有的应用程序都是共存，当引用技术为零的时间，交还给系统，这个时候系统一看，说是不要了，不去做release，系统不知道这块空间释放了，系统会一直保留这个内存空间不释放
    
}


//全局队列
-(void)GCDDemo4{
    
    //全局队列和并发队列的工作特性一致，要用并发队列还要考虑，自定义的并发队列。如果没有什么特殊原因
    //第二个参数是保留的用，第一个写的是优先级，iOS8是服务质量，默认的优先级。
    //1.可以保证iOS7.0和8.0适配
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    
    
    dispatch_async(queue, ^{
        
    });
    
    
    
}


-(void)GCDDemo3{
    
    
    //注意两点，串行队列的创建 单词：SERIAL:连续的，表示串行
    //1.dispatch_queue_t queue = dispatch_queue_creat("字符串",DISPATCH_QUEUE_SERIAL)
    
    
    //dispatch_queue_t queue = dispatch_queue_create("com.itheima", DISPATCH_QUEUE_SERIAL);
    
    //这里就构建了一个串行的队列
    dispatch_queue_t queue = dispatch_queue_create("itheima.con", DISPATCH_QUEUE_SERIAL);
    
    //添加任务，指定执行
    //同步任务,这个也是同步执行
    
    //会开线程吗？不会开线程
    //同步任务。同步不会开xiancheng，主队列，同步一定会死锁吗！
    
    
    dispatch_async(queue, ^{
        //不会开启线程，只会开启一条线程
        
        for(int i = 0;i < 10;i++){
        
            NSLog(@"%@＝＝＝%d",[NSThread currentThread],i);
        }
        NSLog(@"---里面--------game over");
    });
    NSLog(@"-----------game over");
}


-(void)GCDDemo2{
    dispatch_queue_t globleQueue = dispatch_get_global_queue(0, 0);

    //最常用的组合
    dispatch_async(globleQueue, ^{
        //进行好事操作，异步执行好事操作
        NSLog(@"进行好事操作 %@",[NSThread currentThread]);
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"刷新UI界面 %@",[NSThread currentThread]);
        });

    });
}


//GCD最基本的组合，异步加载数据，然后返回主线程进行UI的刷新
-(void)GCDDemo1{
    UIScrollView *mainScrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    mainScrollView.backgroundColor = [UIColor redColor];
    //mainScrollView.contentOffset = CGPointMake(1000, 1000);
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.backgroundColor = [UIColor blueColor];
    
    
    [mainScrollView addSubview:imageView];
    
    [self.view addSubview:mainScrollView];
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSURL *url = [NSURL URLWithString:@"http://pic14.nipic.com/20110522/7411759_164157418126_2.jpg"];
        
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        
        UIImage *image = [UIImage imageWithData:data];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            imageView.image = image;
            [imageView sizeToFit];
            
            //设置可以滚动的范围
            mainScrollView.contentSize = image.size;
            
            //设置scrollview在某一个方向上的偏移量
            mainScrollView.contentOffset = CGPointMake(-20, 20);
            
            //内嵌多少，四边切多少距离
            mainScrollView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
            
            
        });
        
    });
    
}



@end
