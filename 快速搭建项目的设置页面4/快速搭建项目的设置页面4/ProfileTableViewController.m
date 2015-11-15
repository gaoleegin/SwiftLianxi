//
//  ProfileTableViewController.m
//  快速搭建项目的设置页面4
//
//  Created by 高李军 on 15/11/15.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "ProfileTableViewController.h"
#import "GroupItem.h"
#import "SettingItem.h"

@interface ProfileTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSMutableArray *groupArray;

@end

@implementation ProfileTableViewController

-(NSMutableArray *)groupArray{
    if (_groupArray==nil) {
        _groupArray = [NSMutableArray array];
    }
    return _groupArray;
}

-(void)loadView{
    
    UITableView *mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen  mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    
    mainTableView.delegate = self;
    mainTableView.dataSource = self;
    
    
    self.view = mainTableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的";
    
    [self setGroup1];
    [self setGroup2];
    [self setGroup3];
}



-(void)setGroup1{
    GroupItem *group = [[GroupItem alloc]init];
    SettingItem *item1 = [SettingItem initWithitemTitle:@"我的收藏"];
    SettingItem *item2 = [SettingItem initWithitemTitle:@"我的账号"];
    
    group.items = @[item1,item2];
    
    [self.groupArray addObject:group];
    
}

-(void)setGroup2{
    GroupItem *group = [[GroupItem alloc]init];
    SettingItem *item1 = [SettingItem initWithitemTitle:@"我要吐槽"];
    SettingItem *item2 = [SettingItem initWithitemTitle:@"我要评价"];
    
    group.items = @[item1,item2];
    
    [self.groupArray addObject:group];
    
}

-(void)setGroup3{
    GroupItem *group = [[GroupItem alloc]init];
    SettingItem *item1 = [SettingItem initWithitemTitle:@"关于我们"];
    SettingItem *item2 = [SettingItem initWithitemTitle:@"关注我们"];
    
    group.items = @[item1,item2];
    
    [self.groupArray addObject:group];
    
}





-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    GroupItem *grourItem = self.groupArray[section];

    return grourItem.items.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groupArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    
    GroupItem *grourItem = self.groupArray[indexPath.section];
    
    SettingItem *items = grourItem.items[indexPath.row];
    
    cell.textLabel.text = items.itemTitle;
    
    
    
    
    return cell;
}



@end
