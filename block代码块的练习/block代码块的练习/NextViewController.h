//
//  NextViewController.h
//  block代码块的练习
//
//  Created by 高李军 on 15/10/27.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NextViewController : UIViewController

@property(nonatomic,copy) void (^nextViewBlock)(NSString *tftext);

@property(nonatomic,copy)  void (^ndextViewBlock)(NSString *fttextt);



@end
