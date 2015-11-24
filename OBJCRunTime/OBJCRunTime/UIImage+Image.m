//
//  UIImage+Image.m
//  OBJCRunTime
//
//  Created by 高李军 on 15/11/24.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "UIImage+Image.h"
#import <objc/message.h>

@implementation UIImage (Image)

+(void)load{
    Method imageName22 = class_getClassMethod(self, @selector(imageNamed:));
    Method imageWithName22 = class_getClassMethod(self, @selector(imageWithName:));
    
    
    method_exchangeImplementations(imageWithName22, imageName22);
}

+(instancetype)imageWithName:(NSString *)name{
    
    //调用自己写的方法，因为地址已经被调换了，所以直接被替换了。就是直接替换系统方法
    UIImage *image = [self imageWithName:name];
    
    if (image==nil) {
        NSLog(@"加载空的图片");
    }
    
    return image;
}

@end
