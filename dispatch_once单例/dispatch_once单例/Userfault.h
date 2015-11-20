//
//  Userfault.h
//  dispatch_once单例
//
//  Created by 高李军 on 15/11/19.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Userfault : NSObject

+(instancetype)shareUserDefault;

+(instancetype)sharesSyncChroies;


@end
