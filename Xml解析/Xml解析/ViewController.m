//
//  ViewController.m
//  Xml解析
//
//  Created by 高李军 on 15/12/6.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSXMLParserDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self loadData];
}

-(void)loadData{
    //url
    
    NSURL *url = [NSURL URLWithString:@"http://localhost/videos.xml"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:1 timeoutInterval:12.0];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
       
        NSString *stringData = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"=====%@",stringData);
        
        
        NSXMLParser *parser = [[NSXMLParser alloc]initWithData:data];
        
        parser.delegate = self;
        
        [parser parse];
        
        
    }];
}

//开始解析文档
-(void)parserDidStartDocument:(NSXMLParser *)parser{
    NSLog(@"开始解析文档");
}

//开始解析节点
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    NSLog(@"喀什解析节点%@=====%@",elementName,attributeDict);
}

//找到文档的元素
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    NSLog(@"找到新的缘续了");
    
}

//结束解析节点
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    NSLog(@"结束解析节点%@===%@",elementName,qName);
}

//结束解析文档
-(void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"结束解析文档");
}

//出现错误的时间
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    NSLog(@"出现错误");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
