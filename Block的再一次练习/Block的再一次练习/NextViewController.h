//
//  NextViewController.h
//  Block的再一次练习
//
//  Created by 高李军 on 15/11/18.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSString *(^myBlock)(NSString *);

@interface NextViewController : UIViewController

@property(nonatomic,copy) myBlock mmBlock;

@end
