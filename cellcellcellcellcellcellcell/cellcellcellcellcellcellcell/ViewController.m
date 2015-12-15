//
//  ViewController.m
//  cellcellcellcellcellcellcell
//
//  Created by 高李军 on 15/12/14.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "ViewController.h"
#import "DDDDDDDTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,DDDDDDDTableViewCellDelegate>


@property(nonatomic,strong) NSMutableDictionary *mutaDice;


@property(nonatomic,weak)UITableView *maintable;

@end



@implementation ViewController

-(NSMutableDictionary *)mutaDice{
    if (_mutaDice==nil) {
        _mutaDice = [NSMutableDictionary dictionary];
    }
    return _mutaDice;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *maintable = [[UITableView alloc]init];
    maintable.frame = self.view.bounds;
    maintable.delegate = self;
    maintable.dataSource = self;
    [self.view addSubview:maintable];
    self.maintable = maintable;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DDDDDDDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    if (cell==nil) {
        cell = [[DDDDDDDTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    cell.delegate = self;
    
    id booool = [self.mutaDice objectForKey:indexPath];
    
    if (booool==nil) {
        cell.isShouldSelect = NO;
    } else{
        cell.isShouldSelect = [booool boolValue];
    }
    
    cell.indexdPath  =  indexPath;
    
    return cell;
}


-(void)btnClicked:(DDDDDDDTableViewCell *)cell andIndexPath:(NSIndexPath *)indexPath{
    
    
    [self.mutaDice setObject:@(cell.isShouldSelect) forKey:indexPath];

    [self.maintable reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
}


@end
