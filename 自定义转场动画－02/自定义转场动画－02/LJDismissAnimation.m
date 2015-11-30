//
//  LJDismissAnimation.m
//  自定义转场动画－02
//
//  Created by 高李军 on 15/11/30.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "LJDismissAnimation.h"

@implementation LJDismissAnimation

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 3.0f;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    //获得要到哪里去
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    CGRect finalFrame = [transitionContext finalFrameForViewController:fromVC];
    
    CGRect fromVCFrame = CGRectOffset(finalFrame, 0, [UIScreen mainScreen].bounds.size.height);
    
    [[transitionContext containerView] addSubview:fromVC.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromVC.view.frame = fromVCFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    
    
}

@end
