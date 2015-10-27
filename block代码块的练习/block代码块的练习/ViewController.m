//
//  ViewController.m
//  block代码块的练习
//
//  Created by 高李军 on 15/10/27.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.backgroundColor = [UIColor redColor];
    nextBtn.frame = CGRectMake(100, 100, 100, 100);
    [nextBtn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    
        
    
    
}

-(void)btnClicked{
    NextViewController *next = [[NextViewController alloc]init];
    next.view.backgroundColor = [UIColor redColor];
    
    next.nextViewBlock = ^NSArray *(NSString *ft){
        return nil;
    };
    
    next.ndextViewBlock = ^ void(NSString *fttext){
        
    };
    
    [self presentViewController:next animated:true completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end




