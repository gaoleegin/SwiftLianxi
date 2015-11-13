//
//  NextViewController.m
//  09-冒泡排序和block
//
//  Created by 高李军 on 15/11/13.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "NextViewController.h"






@interface NextViewController ()



@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    self.title = @"我是一个好人";
    
    
   
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController popViewControllerAnimated:YES];
   NSString *returntitle =  self.returnBlock(self.title);
    
    NSLog(@"%@",returntitle);
    
    
    
    if ([self.delegate respondsToSelector:@selector(theNextVCtouchBegin:)]) {
        [self.delegate theNextVCtouchBegin:self];
    }
    
     [[NSNotificationCenter defaultCenter] postNotificationName:@"LJTextNotification" object:nil];
}

-(void)dealloc{
    NSLog(@"我就这样走了");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
