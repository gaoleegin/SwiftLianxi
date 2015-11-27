//
//  ViewController.m
//  自定义专场动画1（model）
//
//  Created by 高李军 on 15/11/27.
//  Copyright © 2015年 高李军. All rights reserved.
//


/**
            UIViewControllerTransitioning:控制器的过度    
 *  开发步骤：1.显示定义一个实现了 UIViewControllerContextTransitioning
 *
 *  @param void <#void description#>
 *
 *  @return <#return value description#>
 */




#import "ViewController.h"
#import "TwoViewController.h"
#import "presentTransition.h"
#import "SwipeUpInteractiveTransition.h"
#import "NormalDismissAnimation.h"

@interface ViewController () <TwoViewControllerDelegate,UIViewControllerTransitioningDelegate>

@property(nonatomic,strong)presentTransition *presentTransition;

@property(nonatomic,strong)NormalDismissAnimation *dismissTransition;

@property(nonatomic,strong)SwipeUpInteractiveTransition *swipUpdateInterRation;




@end

@implementation ViewController

-(presentTransition *)presentTransition{
    if (_presentTransition==nil) {
        _presentTransition = [[presentTransition alloc]init];
    }
    return _presentTransition;
}

-(NormalDismissAnimation *)dismissTransition{
    if (_dismissTransition==nil) {
        _dismissTransition = [[NormalDismissAnimation alloc]init];
    }
    return _dismissTransition;
}

-(SwipeUpInteractiveTransition *)swipUpdateInterRation{
    if (_swipUpdateInterRation==nil) {
        _swipUpdateInterRation=[[SwipeUpInteractiveTransition alloc]init];
    }
    return _swipUpdateInterRation;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化子视图
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 60, 50,50)];
    nextBtn.backgroundColor = [UIColor redColor];
    [nextBtn setTitle:@"present" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    nextBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:nextBtn];
    
    
    
    [nextBtn addTarget:self action:@selector(presentNextVC) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.view addSubview:nextBtn];
   
}

-(void)presentNextVC{
    TwoViewController *twoVC = [[TwoViewController alloc]init];
    
    twoVC.delegate = self;
    twoVC.transitioningDelegate = self;
    
    [self.swipUpdateInterRation wireToViewController:twoVC];
    [self presentViewController:twoVC animated:YES completion:nil];
    
}

-(void)dismissTwoVC:(TwoViewController *)twoVC{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self.presentTransition;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return self.dismissTransition;
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator{
    return self.swipUpdateInterRation;
}



@end
