//
//  GroupItem.h
//  快速搭建项目的设置页面4
//
//  Created by 高李军 on 15/11/15.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupItem : NSObject

@property(nonatomic,copy)NSString *headerTitle;

@property(nonatomic,copy)NSString *footerTitle;

@property(nonatomic,strong)NSArray *items;

@end
