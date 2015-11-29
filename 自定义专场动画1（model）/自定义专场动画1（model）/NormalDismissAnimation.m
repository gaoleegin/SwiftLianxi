//
//  NormalDismissAnimation.m
//  VCTransitionDemo
//
//  Created by 王 巍 on 13-10-13.
//  Copyright (c) 2013年 王 巍. All rights reserved.
//

#import "NormalDismissAnimation.h"

@implementation NormalDismissAnimation
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 3.0f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    // 1. Get controllers from transition context
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 2. Set init frame for fromVC
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect initFrame = [transitionContext initialFrameForViewController:fromVC];
    
    
    CGRect finalFrame = CGRectOffset(initFrame, 0, screenBounds.size.height);
    
     CGAffineTransform endAngle = CGAffineTransformMakeRotation(M_PI);
    
    
    CGAffineTransform endAngle1 = CGAffineTransformRotate(fromVC.view.transform, (M_PI));
    
    
    //从哪里来，到哪里去
    
    // 3. Add target view to the container, and move it to back.
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    [containerView sendSubviewToBack:toVC.view];
    
    // 4. Do animate now
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        fromVC.view.frame = finalFrame;
        fromVC.view.transform = endAngle1;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
        }];
}

@end
