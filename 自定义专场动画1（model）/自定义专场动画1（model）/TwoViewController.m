//
//  TwoViewController.m
//  自定义专场动画1（model）
//
//  Created by 高李军 on 15/11/27.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 60, 50,50)];
    nextBtn.backgroundColor = [UIColor blueColor];
    [nextBtn setTitle:@"dismiss" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    nextBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:nextBtn];
    
     [nextBtn addTarget:self action:@selector(dissmissVC) forControlEvents:UIControlEventTouchUpInside];

    self.view.backgroundColor = [UIColor redColor];
}

-(void)dissmissVC{
    
    if ([self.delegate respondsToSelector:@selector(dismissTwoVC:)]) {
        [self.delegate dismissTwoVC:self];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


@end
