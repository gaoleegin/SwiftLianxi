//
//  ViewController.m
//  CAlayer－－－
//
//  Created by 高李军 on 16/1/11.
//  Copyright © 2016年 高李军. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CALayer *layer = [[CALayer alloc]init];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.anchorPoint = CGPointZero;
    layer.position = CGPointZero;
    [self.view.layer addSublayer:layer];
    
    self.view.layer.backgroundColor = [UIColor grayColor].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
