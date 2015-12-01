//
//  ViewController.m
//  magicmove_007
//
//  Created by 高李军 on 15/11/30.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "ViewController.h"
#import "TransitionCollectionViewCell.h"
#import "NextViewViewController.h"
#import "pushAnimation.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UINavigationControllerDelegate>

@property(nonatomic,strong)pushAnimation *pushAnimation;

@end

@implementation ViewController

-(pushAnimation *)pushAnimation{
    if (_pushAnimation==nil) {
        _pushAnimation = [[pushAnimation alloc]init];
    }
    return _pushAnimation;
}

-(void)loadView{

    //必须定义一个布局
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    flowLayout.minimumInteritemSpacing  = 10;
    flowLayout.minimumLineSpacing = 10;
    
    
    CGFloat itemsSize = [UIScreen mainScreen].bounds.size.width * 0.5 - 10;
    
    
    flowLayout.itemSize = CGSizeMake(itemsSize, itemsSize);
    
    
    
    UICollectionView *mainCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:flowLayout];
    mainCollectionView.delegate = self;
    mainCollectionView.dataSource = self;
    
    
    [mainCollectionView registerClass:[TransitionCollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    
    self.view = mainCollectionView;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    UICollectionViewCell *cell = [[UICollectionViewCell alloc]init];
//    cell.backgroundColor = [UIColor redColor];
//    
//    return cell;
    
    TransitionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    
    
    
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld==点击=%ld",(long)indexPath.row,(long)indexPath.section);
    
    
    NextViewViewController *nextVC = [[NextViewViewController alloc]init];
    
    self.navigationController.delegate = self;
    
    //谁负责跳转，就将谁的代理设置为谁的，就将代理设置为谁的
    
    [self.navigationController pushViewController:nextVC animated:YES];
    
}

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    return self.pushAnimation;
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
