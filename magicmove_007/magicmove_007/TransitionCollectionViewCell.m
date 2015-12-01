//
//  TransitionCollectionViewCell.m
//  magicmove_007
//
//  Created by 高李军 on 15/11/30.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "TransitionCollectionViewCell.h"


@interface TransitionCollectionViewCell()



@end


@implementation TransitionCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self==[super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blueColor];
        
        //创建子控件
        [self setUpSubViews];
    }
    return self;
}

-(void)setUpSubViews{
    
    CGFloat itemsSize = [UIScreen mainScreen].bounds.size.width * 0.5 - 10;
    
    UIImageView *iconImageView = [[UIImageView alloc]init];
    iconImageView.frame = CGRectMake(0, 0, itemsSize, itemsSize-30);
    iconImageView.image = [UIImage imageNamed:@"20151018211420_VERJi.jpeg"];
    [self.contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"二师兄";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.frame = CGRectMake(0, itemsSize-30, itemsSize, 30);
    [self.contentView addSubview:titleLabel];
    
}

@end
