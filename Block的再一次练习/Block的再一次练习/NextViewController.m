//
//  NextViewController.m
//  Block的再一次练习
//
//  Created by 高李军 on 15/11/18.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.backgroundColor = [UIColor redColor];
    nameLabel.text = @"用户名字";
    
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
     [self dismissViewControllerAnimated:YES completion:nil];
    
    
    NSString *returnData  =  self.mmBlock(@"hahahaha");
    NSLog(@"%@",returnData);
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)name:(NSString *)name
     passeo:(NSString *)pass
  completed:(void(^)(NSString *))returnBlock{
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
