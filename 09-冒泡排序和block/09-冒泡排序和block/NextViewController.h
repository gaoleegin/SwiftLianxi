//
//  NextViewController.h
//  09-冒泡排序和block
//
//  Created by 高李军 on 15/11/13.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NextViewController;

@protocol NextViewControllerDelegate <NSObject>

-(void)theNextVCtouchBegin:(NextViewController *)nextVC;


@end

@interface NextViewController : UIViewController



@property(nonatomic,weak) id<NextViewControllerDelegate> delegate;


@property(nonatomic,copy) NSString*(^returnBlock)(NSString *);

@end
