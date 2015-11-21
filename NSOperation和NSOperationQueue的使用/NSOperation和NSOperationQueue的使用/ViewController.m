//
//  ViewController.m
//  NSOperation和NSOperationQueue的使用
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
    
//     NSOperation 和 NSOperationQueue是苹果公司对GCD的的封装，完全面向对象，所以使用起来更好的理解。可以说明的是NSOperation和NSOperationQueue分别对应的是GCD的任务和队列。操
    
    //1.将有执行的任务封装到一个NSOperation对象中
    //2.将此任务添加到一个NSOperationQueue对象中
    //值得说明的是，NSOperation知只是一个抽象类，所以不能封装任务，但是他有2个子类用语封装
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
