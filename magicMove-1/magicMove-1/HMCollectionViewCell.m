//
//  HMCollectionViewCell.m
//  magicMove-1
//
//  Created by 高李军 on 15/12/1.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "HMCollectionViewCell.h"

@implementation HMCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self==[super initWithFrame:frame]) {
        //添加子控件
        [self addChildViews];
    }
    return self;
}

-(void)addChildViews{
    
   CGFloat itemsWIdth = ([UIScreen mainScreen].bounds.size.width  - 10) * 0.5;
    //图片；
    
    UIImageView *iconImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"20151018211420_VERJi.jpeg"]];
    
    iconImageView.frame = CGRectMake(0, 0, itemsWIdth, itemsWIdth);
    
    [self.contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    
}



@end
