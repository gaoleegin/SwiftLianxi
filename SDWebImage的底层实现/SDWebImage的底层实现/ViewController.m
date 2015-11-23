//
//  ViewController.m
//  SDWebImage的底层实现
//  就是这个样子就是这么定了，
//  Copyright © 2015年 高李军. All rights reserved.


#import "ViewController.h"
#import "Apps.h"
#import "AppsTableViewCell.h"


@interface ViewController()

@property(nonatomic,strong) NSArray *appsList;


@property(nonatomic,strong)NSOperationQueue *queue;

@property(nonatomic,strong)NSMutableDictionary *downCache;


@end

@implementation ViewController

-(NSMutableDictionary *)downCache{
    if (_downCache==nil) {
        _downCache = [NSMutableDictionary dictionary];
    }
    return _downCache;
}


-(NSOperationQueue *)queue{
    if (_queue==nil) {
        _queue = [[NSOperationQueue alloc]init];
    }
    return _queue;
}

-(NSArray *)appsList{
    if (_appsList==nil) {
        _appsList = [Apps loadAppsArray];
    }
    return _appsList;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.appsList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AppsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"appscells"];
    
    Apps *app = self.appsList[indexPath.row];
    
    cell.titileLabel.text = app.name;
    
    cell.detaileLabel.text = app.download;
    
    if (app.image!=nil) {
        cell.imageV.image = app.image;
        return cell;
    }
    
    if (self.downCache[app.icon]!=nil) {
        NSLog(@"正在下载，请稍候……");
        return cell;
    }
    
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        
        NSURL *url = [NSURL URLWithString:app.icon];
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        UIImage *image = [UIImage imageWithData:data];
        
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            app.image = image;
        
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }];
        
    }];
    
    [self.downCache setValue:op forKey:app.icon];
    
    [self.queue addOperation:op];
    
    return cell;
}



@end