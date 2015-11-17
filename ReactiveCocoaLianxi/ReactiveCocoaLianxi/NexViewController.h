//
//  NexViewController.h
//  ReactiveCocoaLianxi
//
//  Created by 高李军 on 15/11/16.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ReactiveCocoa.h"

@interface NexViewController : UIViewController


@property(nonatomic,strong) RACSubject *delegateSignal;


@end
