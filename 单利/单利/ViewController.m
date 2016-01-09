//
//  ViewController.m
//  单利
//
//  Created by 高李军 on 16/1/9.
//  Copyright © 2016年 高李军. All rights reserved.
//

#import "ViewController.h"
#import "SoundsTools.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    SoundsTools *tools = [SoundsTools sharedSoundTools];
    
//    NSLog(@"%p",&tools);
    
    SoundsTools *tools = [SoundsTools sharedSoundTools];
    NSLog(@"%p",&tools);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    SoundsTools *tools = [SoundsTools sharedSoundTools];
    NSLog(@"%p",&tools);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
