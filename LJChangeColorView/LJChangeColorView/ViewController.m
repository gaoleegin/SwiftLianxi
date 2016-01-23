//
//  ViewController.m
//  LJChangeColorView
//
//  Created by 高李军 on 16/1/23.
//  Copyright © 2016年 高李军. All rights reserved.
//

#import "ViewController.h"
#import "LJChangeView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray * titleArr = @[@"内涵段子",@"搞笑",@"娱乐",@"新闻",@"动态",@"我们"];
    LJChangeView * change = [[LJChangeView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) andTitleArr:titleArr];
    change.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:change];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
