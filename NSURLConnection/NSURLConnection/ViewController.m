//
//  ViewController.m
//  NSURLConnection
//
//  Created by 高李军 on 15/12/1.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"http://m.baidu.com"];
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setValue:@"iPhone" forHTTPHeaderField:@"User-Agent"];
    
    

    //还是要开启会话
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        [data writeToFile:@"/Users/gaolijun/Desktop/123" atomically:YES];
        
        
        NSString *html = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        
        [self.webView loadHTMLString:html baseURL:url];
        
        NSLog(@"=========%@",html);
    }] resume];
//    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        
        [data writeToFile:@"/Users/gaolijun/Desktop/123" atomically:YES];
        
        
        NSString *html = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        
        [self.webView loadHTMLString:html baseURL:url];
        
        NSLog(@"=========%@",html);
    }];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
