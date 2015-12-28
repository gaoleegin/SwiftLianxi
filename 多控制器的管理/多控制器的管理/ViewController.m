//
//  ViewController.m
//  多控制器的管理
//
//  Created by 高李军 on 15/12/25.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "ViewController.h"
#import "FirstCollectionViewController.h"

@interface ViewController ()

@property(nonatomic,strong)UIViewController *currentVC;

@property(nonatomic,strong)FirstCollectionViewController *VC1;

@property(nonatomic,strong)FirstCollectionViewController *VC2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
    
    FirstCollectionViewController *VC1 = [[FirstCollectionViewController alloc]init];
    VC1.view.frame = CGRectMake(0, 0, 100, 100);
    
    FirstCollectionViewController *VC2 = [[FirstCollectionViewController alloc]init];
    VC2.view.backgroundColor = [UIColor grayColor];
    VC2.view.frame = CGRectMake(0, 0, 100, 100);
    
    [self addChildViewController:VC1];
    [self addChildViewController:VC2];
    
    self.currentVC = VC2;
    
    [self.view addSubview:VC1.view];
    [self.view addSubview:VC2.view];
    
    UIButton *changeBtn = [[UIButton alloc]init];
    changeBtn.backgroundColor = [UIColor blueColor];
    changeBtn.frame = CGRectMake(200, 200, 100, 100);
    [changeBtn addTarget:self action:@selector(changeVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeBtn];

}

-(void)changeVC{
//    NSLog(@"已经惦记了按钮");
    
    [self.VC2 didMoveToParentViewController:self];
    
    [self transitionFromViewController:self.currentVC toViewController:self.VC1 duration:4 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
    }  completion:^(BOOL finished) {
        //......
    }];
    
    self.currentVC = self.VC1;
}



















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
