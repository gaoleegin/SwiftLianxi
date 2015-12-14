//
//  DDDDDDDTableViewCell.m
//  cellcellcellcellcellcellcell
//
//  Created by 高李军 on 15/12/14.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "DDDDDDDTableViewCell.h"

@implementation DDDDDDDTableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIButton *btn = [[UIButton alloc]init];
        btn.frame = CGRectMake(0, 0, 100, 100);
        [btn setTitle:@"hahahah" forState:UIControlStateNormal];

        
//        [btn addTarget:self action:@selector(btnCLicked:) forControlEvents:UIControlEventTouchUpInside];
        
        
        btn.backgroundColor = [UIColor redColor];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        
        [self.contentView addSubview:btn];
        
        self.cellBtn = btn;
        
    }
    return self;
}

-(void)btnCLicked:(UIButton *)btn {
    btn.selected = !btn.selected;
}

@end
