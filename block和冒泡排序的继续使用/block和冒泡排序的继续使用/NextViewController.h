//
//  NextViewController.h
//  block和冒泡排序的继续使用
//
//  Created by 高李军 on 15/10/28.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^myBlock)(NSString *name);

@interface NextViewController : UIViewController

//定义回调
@property(nonatomic,copy) myBlock myBlock;



@end
