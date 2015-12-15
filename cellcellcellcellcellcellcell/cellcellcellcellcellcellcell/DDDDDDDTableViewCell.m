//
//  DDDDDDDTableViewCell.m
//  cellcellcellcellcellcellcell
//
//  Created by 高李军 on 15/12/14.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "DDDDDDDTableViewCell.h"


@interface DDDDDDDTableViewCell()

@property(nonatomic,weak) UIButton *cellBtn;

@end

@implementation DDDDDDDTableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIButton *btn = [[UIButton alloc]init];
        btn.frame = CGRectMake(0, 0, 100, 100);
        [btn setTitle:@"hahahah" forState:UIControlStateNormal];
        [btn setTitle:@"dddd" forState:UIControlStateSelected];
        btn.backgroundColor = [UIColor redColor];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnCLicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
        
        self.cellBtn = btn;
        
    }
    return self;
}

-(void)setIsShouldSelect:(BOOL)isShouldSelect{
    _isShouldSelect = isShouldSelect;
    self.cellBtn.selected = _isShouldSelect;
}


-(void)btnCLicked:(UIButton *)btn {
    
    self.cellBtn.selected = !self.cellBtn.selected;
    self.isShouldSelect = self.cellBtn.selected;
    if ([self.delegate respondsToSelector:@selector(btnClicked:andIndexPath:)]) {
        [self.delegate btnClicked:self andIndexPath:self.indexdPath];
    }
}

@end
