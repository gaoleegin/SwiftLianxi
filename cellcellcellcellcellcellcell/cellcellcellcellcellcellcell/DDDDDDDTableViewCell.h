//
//  DDDDDDDTableViewCell.h
//  cellcellcellcellcellcellcell
//
//  Created by 高李军 on 15/12/14.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DDDDDDDTableViewCell;
@protocol DDDDDDDTableViewCellDelegate <NSObject>

-(void)btnClicked:(DDDDDDDTableViewCell *)cell andIndexPath:(NSIndexPath *)indexPath;

@end




@interface DDDDDDDTableViewCell : UITableViewCell

@property(nonatomic,weak) id<DDDDDDDTableViewCellDelegate>delegate;

@property(nonatomic,assign) BOOL isShouldSelect;

@property(nonatomic,strong) NSIndexPath *indexdPath;

@end
