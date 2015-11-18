//
//  ViewController.m
//  Block的再一次练习
//
//  Created by 高李军 on 15/11/18.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

typedef void(^myBlock)(bool);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self name:@"damaiwang" passwor:@"400" complete:^(NSString *name) {
        NSLog(@"%@",name);
    }];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NextViewController *nexrVC = [[NextViewController alloc]init];
    
    nexrVC.myBlock = ^(NSString *title){
       
        NSLog(@"%@",title);
        return @"返回的数据";
    };
    
    [self presentViewController:nexrVC animated:YES completion:nil];

}


-(void)name:(NSString *)name
    passwor:(NSString *)pass
   complete:(void(^)(NSString *))myBlock{
    
    NSString *string = [NSString stringWithFormat:@"%@%@",name,pass];
    
    myBlock(string);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
