//
//  flagsModel.h
//  ReactiveCocoaLianxi
//
//  Created by 高李军 on 15/11/17.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface flagsModel : NSObject

@property(nonatomic,copy) NSString *icon;

@property(nonatomic,copy)NSString *naem;


+(instancetype)flagsModelWithDict:(NSDictionary *)dict;



@end
