//
//  LJFlyBirdViewController.m
//  LJFlyBird
//
//  Created by 高李军 on 16/1/18.
//  Copyright © 2016年 高李军. All rights reserved.
//

#import "LJFlyBirdViewController.h"
#import "UIView+LJChangeFrame.h"

//3.0初速度需要60秒减少至0
const float MaxTime = 50;
//加速度，方向向下
const float VG = 0.05;
//初速度
const float MaxV = 2.5;

//初始化总路程
const float AllLength = 692;

#define KScriencreenW  [UIScreen mainScreen].bounds.size.width

#define KScriencreenH [UIScreen mainScreen].bounds.size.height

@interface LJFlyBirdViewController ()


@property(nonatomic,weak)UIView *birdView;


@property(nonatomic,strong)NSTimer *timer;

@end

@implementation LJFlyBirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //布置场景
    [self setscene];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.08 target:self selector:@selector(changFrame) userInfo:nil repeats:YES];
    
    [_timer fire];
}

-(void)setscene{

    UIView *birdView = [[UIView alloc]init];
    birdView.frame = CGRectMake(100, 100, 20, 20);
    birdView.backgroundColor = [UIColor redColor];
    [self.view addSubview:birdView];
    self.birdView = birdView;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewtap)];
    
    [self.view addGestureRecognizer:tap];
    
    
}

-(void)changFrame{
    
     self.birdView.transform = CGAffineTransformTranslate(self.birdView.transform, 0, 1);
    
    NSLog(@"%@",NSStringFromCGRect(self.birdView.frame));
}

-(void)viewtap{
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    self.birdView.transform = CGAffineTransformRotate(transform, M_PI_4);
    
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
