//
//  PushAnimation.m
//  magicMove-1
//
//  Created by 高李军 on 15/12/1.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "PushAnimation.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "HMCollectionViewCell.h"

@implementation PushAnimation

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.8f;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    
    UIView *contanerView = [transitionContext containerView];
    
    
    SecondViewController *toVC = (SecondViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    FirstViewController *fromVC = (FirstViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    CGRect fromVCFrame = [transitionContext initialFrameForViewController:fromVC];
    
    
//    [[fromVC.collectionView cellForItemAtIndexPath:[fromVC.collectionView indexPathsForSelectedItems].firstObject]]];
    
     HMCollectionViewCell *selectCell = (HMCollectionViewCell *)[fromVC.collectionView cellForItemAtIndexPath:[[fromVC.collectionView indexPathsForSelectedItems] firstObject]];
    
    UIImageView *imageView = selectCell.iconImageView;
    
    UIView *snapView = [imageView snapshotViewAfterScreenUpdates:NO];
    
    CGRect snapFrameOfcontaner = [contanerView convertRect:selectCell.iconImageView.frame fromView:selectCell.iconImageView.superview];
    
    NSLog(@"=====后=====%@",NSStringFromCGRect(snapFrameOfcontaner));
    
    
    
    
    NSLog(@"=====前======%@",NSStringFromCGRect(imageView.frame));
    
    CGRect toVCFrame = [transitionContext finalFrameForViewController:toVC];
    
    CGRect transtoVCFrame = CGRectOffset(toVCFrame, [UIScreen mainScreen].bounds.size.width, 0);
    
    CGRect transFromVCFrame = CGRectOffset(fromVCFrame, 0, [UIScreen mainScreen].bounds.size.height);
    
    toVC.view.frame = transtoVCFrame;
    snapView.frame = snapFrameOfcontaner;
    
    fromVC.collectionView.hidden = YES;
    snapView.alpha = 0.0;
    toVC.view.alpha = 0.0;
    
    [[transitionContext containerView] addSubview:snapView];
   [[transitionContext containerView] addSubview:toVC.view];
   
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        [[transitionContext containerView] setNeedsLayout];
        toVC.view.frame = toVCFrame;
        
        snapView.frame = CGRectMake(100, 100, 182.5, 182.5);
        snapView.alpha = 1.0;
        toVC.view.alpha = 1.0;
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
        fromVC.collectionView.hidden  = NO;
        [[transitionContext containerView].subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }];

}

@end
