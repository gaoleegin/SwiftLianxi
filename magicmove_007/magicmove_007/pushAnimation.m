//
//  pushAnimation.m
//  magicmove_007
//
//  Created by 高李军 on 15/11/30.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "pushAnimation.h"

@implementation pushAnimation

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 1.0f;
}


-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    
    
    
    CGRect fffFrame = CGRectOffset(finalFrame, -[UIScreen mainScreen].bounds.size.width, 0);
    
    toVC.view.frame = fffFrame;
    
    [[transitionContext containerView] addSubview:toVC.view];
    
    [UIView animateWithDuration:1.0f animations:^{

        toVC.view.frame = finalFrame;
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
}

@end
