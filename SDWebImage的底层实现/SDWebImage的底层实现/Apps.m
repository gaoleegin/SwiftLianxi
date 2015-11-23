//
//  Apps.m
//  SDWebImage的底层实现
//  
//  Created by 高李军 on 15/11/23.老子就是不管这只股票
//  Copyright © 2015年 高李军. All rights reserved.


#import "Apps.h"

@implementation Apps

+(instancetype)appsWithDict:(NSDictionary *)dict{
    
    id instance = [[self alloc]init ];
    
    [instance setValuesForKeysWithDictionary:dict];
    
    return instance;
}

+(NSArray *)loadAppsArray{

    //就是这个样子的
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"apps.plist" withExtension:nil];
    
    NSArray *appsList = [NSArray arrayWithContentsOfURL:url];
    
    
    NSMutableArray *mutaArray = [NSMutableArray arrayWithCapacity:appsList.count];
    
    [appsList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        [mutaArray addObject:[Apps appsWithDict:obj]];
        
    }];
    
    
    
    return [mutaArray copy];
}



@end
