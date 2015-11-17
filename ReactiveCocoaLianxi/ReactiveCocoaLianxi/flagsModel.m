//
//  flagsModel.m
//  ReactiveCocoaLianxi
//
//  Created by 高李军 on 15/11/17.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "flagsModel.h"

@implementation flagsModel


+(instancetype)flagsModelWithDict:(NSDictionary *)dict{

    flagsModel *model = [[flagsModel alloc]init];
    model.naem = dict[@"name"];
    model.icon = dict[@"icon"];
    return model;
}


@end
