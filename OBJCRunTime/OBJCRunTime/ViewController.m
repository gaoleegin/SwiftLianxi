//
//  ViewController.m
//  OBJCRunTime
//
//  Created by 高李军 on 15/11/24.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/message.h>
#import "UIImage+Image.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person *p = [[Person alloc]init];
    objc_msgSend(p, @selector(eat));
    
    objc_msgSend([Person class], @selector(eat));
    
    [UIImage imageNamed:@"222"];

    
}

@end
