//
//  SettingItem.m
//  快速搭建项目的设置页面4
//
//  Created by 高李军 on 15/11/15.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "SettingItem.h"

@implementation SettingItem

+(instancetype)initWithitemTitle:(NSString *)title{
    SettingItem *item = [[SettingItem alloc]init];
    item.itemTitle = title;
    return item;
}

@end
