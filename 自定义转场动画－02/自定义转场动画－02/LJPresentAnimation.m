//
//  LJPresentAnimation.m
//  自定义转场动画－02
//
//  Created by 高李军 on 15/11/30.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "LJPresentAnimation.h"

@implementation LJPresentAnimation


//返回一个时间
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 3;
}

//动画的效果
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    //去向哪个控制器
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //来自于那个控制器
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    
    //然后拿到每一个控制器的VIew的frame
    CGRect finaleFrame = [transitionContext finalFrameForViewController:toVC];
    
    CGRect toFrame = [transitionContext initialFrameForViewController:fromVC];
    
    CGRect toVCFrame = CGRectOffset(finaleFrame, 0, [UIScreen mainScreen].bounds.size.height);

    toVC.view.frame = toVCFrame;
    [[transitionContext containerView] addSubview:toVC.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toVC.view.frame = CGRectMake(100, 100, 200, 200);
        toVC.view.transform = CGAffineTransformRotate(toVC.view.transform, M_PI);
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
        
    }];
}

@end
