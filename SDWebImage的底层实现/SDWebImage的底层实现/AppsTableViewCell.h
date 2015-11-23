//
//  AppsTableViewCell.h
//  SDWebImage的底层实现
//
//  Created by 高李军 on 15/11/23.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *titileLabel;
@property (weak, nonatomic) IBOutlet UILabel *detaileLabel;

@end
