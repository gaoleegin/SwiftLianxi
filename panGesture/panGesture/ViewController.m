//
//  ViewController.m
//  panGesture
//
//  Created by 高李军 on 16/1/5.
//  Copyright © 2016年 高李军. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,weak)UIView *mainView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIView *mainViewa = [[UIView alloc]init];
    mainViewa.backgroundColor = [UIColor redColor];
    mainViewa.frame = CGRectMake(0, 0, 100, 100);
    [self.view addSubview:mainViewa];
    self.mainView = mainViewa;
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(aaaaaaa:)];
    
    [self.mainView addGestureRecognizer:panGesture];
}


-(void)aaaaaaa:(UIPanGestureRecognizer *)gesture{
    [gesture translationInView:self.mainView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
