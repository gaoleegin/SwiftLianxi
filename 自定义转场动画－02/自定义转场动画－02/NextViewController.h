//
//  NextViewController.h
//  自定义转场动画－02
//
//  Created by 高李军 on 15/11/30.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NextViewController;

@protocol NextViewControllerDelegate <NSObject>

-(void)dismissNextVC:(NextViewController *)nextVC;

@end

@interface NextViewController : UIViewController

@property(nonatomic,weak) id<NextViewControllerDelegate> delegate;


@end
