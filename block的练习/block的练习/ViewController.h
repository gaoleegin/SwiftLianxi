//
//  ViewController.h
//  block的练习
//
//  Created by 高李军 on 15/10/27.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic,copy) void (^myBlock)(NSString *ft);

@property(nonatomic,copy) void (^mmyBlock)();



@end

