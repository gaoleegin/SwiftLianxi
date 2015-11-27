//
//  TwoViewController.h
//  自定义专场动画1（model）
//
//  Created by 高李军 on 15/11/27.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TwoViewController;
@protocol TwoViewControllerDelegate <NSObject>

-(void)dismissTwoVC:(TwoViewController *)twoVC;

@end

@interface TwoViewController : UIViewController

@property(nonatomic,weak) id<TwoViewControllerDelegate>delegate;

@end
