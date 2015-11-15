//
//  GroupItem.h
//  App的主流框架的搭建和设置界面的搭建
//
//  Created by 高李军 on 15/11/15.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupItem : NSObject

@property(nonatomic,copy)NSString *headerTitle;

@property(nonatomic,copy)NSString *FooterTitle;

@property(nonatomic,strong)NSArray *items;


@end
