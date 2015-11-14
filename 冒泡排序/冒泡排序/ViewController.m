//
//  ViewController.m
//  冒泡排序
//
//  Created by 高李军 on 15/11/13.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@",[self maopaoSort:[NSMutableArray arrayWithObjects:@2,@4,@4,@1,@34,@12, nil]]);
    
    
}


-(NSArray *)maopaoSort:(NSMutableArray *)mutaArray{
    
    for (int i = 0; i< mutaArray.count; i++) {
        for (int j= 0; j< mutaArray.count-i-1; j++) {
            if ([mutaArray[j] integerValue] < [mutaArray[j+1] integerValue]) {
                NSInteger temp = [mutaArray[j+1] integerValue];
                mutaArray[j+1] = mutaArray[j];
                mutaArray[j]  = [NSNumber numberWithInteger:temp];
            }
        }
    }
    
    return [mutaArray copy];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
