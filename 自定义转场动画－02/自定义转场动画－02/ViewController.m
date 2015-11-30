//
//  ViewController.m
//  自定义转场动画－02
//
//  Created by 高李军 on 15/11/30.
//  Copyright © 2015年 高李军. All rights reserved.
//  

#import "ViewController.h"
#import "NextViewController.h"
#import "LJPresentAnimation.h"
#import "LJDismissAnimation.h"

@interface ViewController ()<NextViewControllerDelegate,UIViewControllerTransitioningDelegate,UINavigationControllerDelegate,UITabBarControllerDelegate>

@property(nonatomic,strong)LJPresentAnimation *presentAnimation;

@property(nonatomic,strong)LJDismissAnimation *dismissAnimation;

@end

@implementation ViewController

-(LJPresentAnimation *)presentAnimation{
    if (_presentAnimation == nil) {
        _presentAnimation  = [[LJPresentAnimation alloc]init];
    }
    return _presentAnimation;
}

-(LJDismissAnimation *)dismissAnimation{
    if (_dismissAnimation==nil) {
        _dismissAnimation  = [[LJDismissAnimation alloc]init];
    }
    return _dismissAnimation;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //添加一个按钮
    UIButton *presentBtn = [[UIButton alloc]init];
    [presentBtn setTitle:@"出现" forState:UIControlStateNormal];
    presentBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    presentBtn.backgroundColor = [UIColor redColor];
    [presentBtn addTarget:self action:@selector(presentNext) forControlEvents:UIControlEventTouchUpInside];
    presentBtn.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:presentBtn];
}

-(void)dismissNextVC:(NextViewController *)nextVC{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)presentNext{
    NextViewController *nextVC = [[NextViewController alloc]init];
    nextVC.delegate = self;
    nextVC.view.backgroundColor = [UIColor blueColor];
    nextVC.transitioningDelegate = self;
    [self presentViewController:nextVC animated:YES completion:nil];
}


-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self.presentAnimation;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return self.dismissAnimation;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
