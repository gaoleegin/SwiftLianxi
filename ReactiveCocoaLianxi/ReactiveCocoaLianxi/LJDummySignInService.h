//
//  LJDummySignInService.h
//  ReactiveCocoaLianxi
//
//  Created by 高李军 on 15/11/17.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import <Foundation/Foundation.h>

//定义一个block，传入的参数是一个bool值，不需要返回值

typedef void (^LJSinInResponse)(BOOL);

@interface LJDummySignInService : NSObject

-(void)signInWithUsername:(NSString *)userName
                 password:(NSString *)password
               complicate:(LJSinInResponse)completeBlock;

@end
