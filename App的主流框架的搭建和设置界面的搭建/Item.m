//
//  Item.m
//  App的主流框架的搭建和设置界面的搭建
//
//  Created by 高李军 on 15/11/15.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "Item.h"

@implementation Item

+(instancetype)itemWithTitle:(NSString*)title{
    Item *item = [[Item alloc]init];
    item.title = title;
    return item;
}

@end
