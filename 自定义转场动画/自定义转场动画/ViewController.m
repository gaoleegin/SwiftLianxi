//
//  ViewController.m
//  自定义转场动画

//  Created by 高李军 on 15/11/25.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "ViewController.h"
#import "pushViewcontroller.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate>

@property(nonatomic,strong)NSArray *itemsArray;

@end

@implementation ViewController

//搭建框架

-(NSArray *)itemsArray{
    if (_itemsArray==nil) {
        _itemsArray = @[@"push",@"present",@"tabs"];
    }
    return _itemsArray;
}

-(void)loadView{
   
    UITableView *mainTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    mainTable.delegate = self;
    mainTable.dataSource = self;
    
    mainTable.backgroundColor = [UIColor redColor];
    
    self.view = mainTable;
};


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemsArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cellID";
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    cell.textLabel.text = self.itemsArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
    
        pushViewcontroller *poshVC = [[pushViewcontroller alloc]init];
        UINavigationController  *navVC = [[UINavigationController alloc]initWithRootViewController:poshVC];
        
        navVC.delegate = self;
        
        [self presentViewController:navVC animated:true completion:nil];
        
        
    } else if(indexPath.row==1){
    
    } else if(indexPath.row==2){
        
    }
}

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    return nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}


@end
