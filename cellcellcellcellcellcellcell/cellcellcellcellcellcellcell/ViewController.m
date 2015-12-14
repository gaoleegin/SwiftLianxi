//
//  ViewController.m
//  cellcellcellcellcellcellcell
//
//  Created by 高李军 on 15/12/14.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "ViewController.h"
#import "DDDDDDDTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *maintable = [[UITableView alloc]init];
    maintable.frame = self.view.bounds;
    maintable.delegate = self;
    maintable.dataSource = self;
    [self.view addSubview:maintable];
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellid";
    DDDDDDDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell==nil) {
        cell = [[DDDDDDDTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    if (cell.isShouldSelect) {

        [cell.cellBtn setTitle:@"dddd" forState:UIControlStateSelected];
        
    } else {

        [cell.cellBtn setTitle:@"hahahah" forState:UIControlStateNormal];
    }
    
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}












@end
