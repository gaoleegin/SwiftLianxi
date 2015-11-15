//
//  ProfileViewController.m
//  App的主流框架的搭建和设置界面的搭建
//
//  Created by 高李军 on 15/11/15.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "ProfileViewController.h"
#import "GroupItem.h"
#import "Item.h"

@interface ProfileViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSMutableArray *groupArray;


@end

@implementation ProfileViewController

-(NSMutableArray *)groupArray{
    if (_groupArray==nil) {
        _groupArray = [NSMutableArray array];
    }
    return  _groupArray;
}

-(void)loadView{
    
    
    //替换视图，将当前的视图替换为UITableView
    UITableView *mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    
    mainTableView.delegate =self;
    mainTableView.dataSource = self;
    
    self.view = mainTableView;
}


// mark UITableViewDelegate and UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    GroupItem *grouItem = self.groupArray[section];
    
    return grouItem.items.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  self.groupArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }
    
    GroupItem *grouItem = self.groupArray[indexPath.section];
    Item *item = grouItem.items[indexPath.row];
    
    cell.textLabel.text = item.title;
    return cell;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建第一组
    [self setUpGroup1];
    
    //创建第二组
    
    [self setUpGroup2];
    
    //创建第三组
    
    [self setUpGroup3];
}


-(void)setUpGroup1{
    GroupItem *groupItem = [[GroupItem alloc]init];
    
    Item *item1 = [Item itemWithTitle:@"我的收藏"];
    Item *item2 = [Item itemWithTitle:@"我的账号"];
    
    groupItem.items = @[item1,item2];
    
    [self.groupArray addObject:groupItem];
    
}

-(void)setUpGroup2{
    GroupItem *groupItem = [[GroupItem alloc]init];
    
    Item *item1 = [Item itemWithTitle:@"我要评价"];
    Item *item2 = [Item itemWithTitle:@"我要吐槽"];
    
    groupItem.items = @[item1,item2];
    
    [self.groupArray addObject:groupItem];
    
}

-(void)setUpGroup3{
    GroupItem *groupItem = [[GroupItem alloc]init];
    
    Item *item1 = [Item itemWithTitle:@"关于我们"];
    Item *item2 = [Item itemWithTitle:@"关注我们"];
    
    groupItem.items = @[item1,item2];
    
    [self.groupArray addObject:groupItem];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
