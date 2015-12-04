//
//  ViewController.m
//  UICollectionView+UITableView
//
//  Created by 高李军 on 15/12/1.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "ViewController.h"
#import "LJCellCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.navigationController setNavigationBarHidden:YES];
    
    [self addSubViews];
}
-(void)addSubViews{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    CGFloat itemdWidth = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat itemdHeight = [UIScreen mainScreen].bounds.size.height - 220;
    flowLayout.itemSize = CGSizeMake(itemdWidth, itemdHeight);
    flowLayout.minimumLineSpacing = 0;
    
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //UICollectionView
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 220, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-220) collectionViewLayout:flowLayout];
    
    collectionView.pagingEnabled = YES;
    
    [collectionView registerClass:[LJCellCollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    collectionView.delegate = self;
    collectionView.dataSource  =  self;
    collectionView.bounces = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:collectionView];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LJCellCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    
    if (indexPath.row==0) {
        cell.backgroundColor = [UIColor redColor];
    } else{
        cell.backgroundColor = [UIColor blueColor];
        
    }
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 2;
}


@end
