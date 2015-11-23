//
//  Apps.h
//  SDWebImage的底层实现
//  Created by 高李军 on 15/11/23.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Apps : NSObject

@property(nonatomic,copy) NSString *name;

@property(nonatomic,copy) NSString *icon;

@property(nonatomic,copy) NSString *download;

@property(nonatomic,strong) UIImage *image;


+(instancetype)appsWithDict:(NSDictionary *)dict;


+(NSArray *)loadAppsArray;

@end
