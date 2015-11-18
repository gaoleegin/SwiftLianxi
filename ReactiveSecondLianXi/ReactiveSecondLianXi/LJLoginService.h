//
//  LJLoginService.h
//  ReactiveSecondLianXi
//
//  Created by 高李军 on 15/11/18.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^completeBlock)(BOOL);
@interface LJLoginService : NSObject



-(void)sigInWithuserNam:(NSString *)userName
               password:(NSString *)password
               complete:(completeBlock)compleBlock;

@end
