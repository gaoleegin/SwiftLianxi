//
//  NextViewController.m
//  自定义转场动画－02
//
//  Created by 高李军 on 15/11/30.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *presentBtn = [[UIButton alloc]init];
    [presentBtn setTitle:@"消失" forState:UIControlStateNormal];
    presentBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    presentBtn.backgroundColor = [UIColor grayColor];
    [presentBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    presentBtn.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:presentBtn];
}

-(void)dismiss{
    if ([self.delegate respondsToSelector:@selector(dismissNextVC:)]) {
        [self.delegate dismissNextVC:self];
    }
}

@end
