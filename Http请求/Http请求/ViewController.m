//
//  ViewController.m
//  Http请求
//
//  Created by 高李军 on 15/12/5.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSURL *url = [NSURL URLWithString:@"http://localhost/demo.json"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSLog(@"%@",data);
        
        NSString *dataString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@",dataString);
        
    }];
    
    
}

@end
