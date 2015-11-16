//
//  ViewController.m
//  ReactiveCocoa的简单学习
//
//  Created by 高李军 on 15/11/16.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+CaculatorMaker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    int result = [NSObject caculotors:^(Caculoter *maker) {
        maker.add(3).add(4);
    }];
    
    NSLog(@"===========%d",result);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
