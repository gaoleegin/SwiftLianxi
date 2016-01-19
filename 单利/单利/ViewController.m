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

@property(nonatomic,weak)UIView *bgview;

@end

#define randomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];

@implementation ViewController

- (void)viewDidLoad {
    
    UIView *bgview = [[UIView alloc]init];
    bgview.backgroundColor = randomColor;
    
    bgview.frame = CGRectMake(0, 0, 100, 100);
    [self.view addSubview:bgview];

    self.bgview = bgview;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    self.bgview.transform  = CGAffineTransformRotate(self.bgview.transform, M_PI_4);
    
    CATransition *anim = [CATransition animation];
    anim.type = @"moveIn";
    anim.duration = 2.0;
    [self.bgview.layer addAnimation:anim forKey:nil];

}



@end
