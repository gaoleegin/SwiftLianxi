//
//  ViewController.m
//  NSThread的使用
//
//  Created by 高李军 on 15/11/20.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //NSThread的使用
    
    //NSThread这套方案是经过苹果封装的，并且完全面向对象的，所以我们可以直接操控线程对象，非常直观和方便。但是，他的生命周期还是需要我们手动进行管理，所以这套方案也只是偶尔用用，比如[NSThread currentThread],它可以获取当前的线程类，我们就可以知道当前的线程的各种属性，用于调试十分方便
    
    [self NSThreadDemo4];
    
}

-(void)NSThreadDemo1{
    //创建线程,代码还是易于理解的
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(run) object:nil];
    //启动线程
    [thread start];
    
    
    [self performSelector:@selector(run) onThread:thread withObject:nil waitUntilDone:YES];
    
    
    NSThread *main = [NSThread mainThread];
    
    //暂停当前的线程2秒
    [NSThread sleepForTimeInterval:2.0];
    
    //暂停当前的线程2秒
    NSDate *date = [NSDate dateWithTimeInterval:2 sinceDate:[NSDate date]];
    [NSThread sleepUntilDate:date];
    
    
}


-(void)NSThreadDemo4{
    // 创建并自动启动,仍然不是在主线程上面执行
    [NSThread detachNewThreadSelector:@selector(run) toTarget:self withObject:nil];
}

-(void)NSThreadDemo3{
    

    [self performSelectorOnMainThread:@selector(run) withObject:@"我在主线程上面" waitUntilDone:NO];
    
}

-(void)NSThreadDemo2{
    //自己就会创建线程,会自动的创建一条线程
    [self performSelectorInBackground:@selector(run) withObject:@"我是自动创建出来的"];
    
    
    [self performSelector:@selector(run) withObject:nil];
}

-(void)run{
    NSLog(@"%@",[NSThread currentThread]);
}







@end
