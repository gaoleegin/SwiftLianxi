//
//  ViewController.m
//  快速搭建项目的设置页面4
//
//  Created by 高李军 on 15/11/15.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "ViewController.h"
#import "GroupItem.h"
#import "SettingItem.h"

@interface ViewController ()

@property(nonatomic,strong)NSMutableArray *groupArray;

@end

@implementation ViewController


-(NSMutableArray *)groupArray{
    if (_groupArray==nil) {
        _groupArray = [NSMutableArray array];
    }
    return _groupArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //设置第一组数据
    
    
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
