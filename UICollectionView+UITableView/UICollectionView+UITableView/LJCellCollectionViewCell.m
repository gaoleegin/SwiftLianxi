//
//  LJCellCollectionViewCell.m
//  UICollectionView+UITableView
//
//  Created by 高李军 on 15/12/1.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "LJCellCollectionViewCell.h"

@interface LJCellCollectionViewCell()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation LJCellCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{
    if (self==[super initWithFrame:frame]) {
        //创建控件
        [self setUpChildViews];
    }
    return self;
}

-(void)setUpChildViews{
    UITableView *mainTableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    mainTableView.delegate = self;
    mainTableView.dataSource  = self;
    [self.contentView addSubview:mainTableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

@end
