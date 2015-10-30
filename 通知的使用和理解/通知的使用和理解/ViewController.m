//
//  ViewController.m
//  通知的使用和理解
//
//  Created by 高李军 on 15/10/28.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
- (IBAction)btnClicked;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] postNotificationName:@"dddddd" object:nil];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changColor:) name:@"dddddd" object:nil];
    
}

-(void)changColor:(NSNotification *)note{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
