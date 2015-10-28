//
//  NextViewController.m
//  block和冒泡排序的继续使用
//
//  Created by 高李军 on 15/10/28.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()
- (IBAction)btnClicked;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)btnClicked{
    
    self.myBlock(@"高李军");
    [self dismissViewControllerAnimated:YES completion:nil];
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
