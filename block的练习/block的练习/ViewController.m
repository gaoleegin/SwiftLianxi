//
//  ViewController.m
//  block的练习
//
//  Created by 高李军 on 15/10/27.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myBlock = ^(NSString *ft){
        
    };
    
    self.mmyBlock = ^void(){
       
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
