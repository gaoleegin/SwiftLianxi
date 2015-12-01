//
//  FirstViewController.m
//  magicMove-1
//
//  Created by 高李军 on 15/12/1.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "FirstViewController.h"
#import "HMCollectionViewCell.h"
#import "SecondViewController.h"
#import "PushAnimation.h"

@interface FirstViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UINavigationControllerDelegate>

@end

@implementation FirstViewController

//替换视图
-(void)loadView{
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    flowLayout.minimumInteritemSpacing = 10;
    
    CGFloat itemsWIdth = ([UIScreen mainScreen].bounds.size.width  - 10) * 0.5;
    
    
    CGSize itemsSize = CGSizeMake(itemsWIdth, itemsWIdth);
    
    flowLayout.itemSize = itemsSize;
    
    UICollectionView *collectionView = [[UICollectionView alloc]
                                        initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:flowLayout];
    
    [collectionView registerClass:[HMCollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    self.view  = collectionView;
    self.collectionView = collectionView;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HMCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    return cell;
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"第一控制器";
    self.view.backgroundColor = [UIColor redColor];
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld====%ld",indexPath.row,indexPath.section);
    
    
    
    HMCollectionViewCell *selectCell = (HMCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    UIImageView *iconImageView = selectCell.iconImageView;
    
    //进行控制器的跳转
    SecondViewController *secondVC = [[SecondViewController alloc]init];
    
    self.navigationController.delegate = self;
    
    [self.navigationController pushViewController:secondVC animated:YES];
    
}

-(void)addClikedBtn{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0){
   // return [PushAnimation new];
    
    if([fromVC isKindOfClass:[FirstViewController class]]){
        return [PushAnimation new];
    } else{
        return nil;
    }
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
