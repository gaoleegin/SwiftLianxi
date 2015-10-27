//
//  NextViewController.m
//  block代码块的练习
//
//  Created by 高李军 on 15/10/27.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()


@property(nonatomic,copy) void (^myBlcok)(NSString *tfText);

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self dismissViewControllerAnimated:true completion:nil];
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
