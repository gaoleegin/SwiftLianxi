//
//  NexViewController.m
//  ReactiveCocoaLianxi
//
//  Created by 高李军 on 15/11/16.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "NexViewController.h"

@interface NexViewController ()

@end

@implementation NexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *twoButton = [[UIButton alloc]init];
    twoButton.backgroundColor = [UIColor redColor];
    twoButton.frame = CGRectMake(0, 0, 100, 100);
    
    [twoButton addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:twoButton];

}

-(void)btnClicked{
    if (self.delegateSignal) {
        [self.delegateSignal sendNext:@[@1,@3,@4]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
