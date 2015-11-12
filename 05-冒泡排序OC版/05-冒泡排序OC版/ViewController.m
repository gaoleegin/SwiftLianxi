//
//  ViewController.m
//  05-冒泡排序OC版
//
//  Created by 高李军 on 15/11/12.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

@interface ViewController ()
- (IBAction)nextVCAction:(UIBarButtonItem *)sender;

@property (weak, nonatomic) IBOutlet UILabel *thisLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *mutaArray = [NSMutableArray arrayWithObjects:@2,@4,@34,@1, nil];
    /**
     *  这个就是用OC写一个冒泡排序
     */
    
    NSLog(@"%@",[self bubbleSort:mutaArray]);
    
}

-(NSArray *)bubbleSort:(NSMutableArray *)mutaArray{
    
    for (int i =0; i<mutaArray.count; i++) {
        for (int j = 0; j<mutaArray.count - i - 1; j++) {
            if ([mutaArray[j] doubleValue] < [mutaArray[j+1] doubleValue]) {
                double temp = [mutaArray[j] doubleValue];
                mutaArray[j]  = mutaArray[j+1];
                mutaArray[j+1] = [NSNumber numberWithDouble:temp];
            }
        }
    }
    
    return [mutaArray copy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextVCAction:(UIBarButtonItem *)sender {
    
    NextViewController *nextVC = [[NextViewController alloc]init ];
    
    
    nextVC.returnBlock = ^ NSString*(NSString *title){
        return  @"haha";
    };
    
    [self.navigationController pushViewController:nextVC animated:YES];
    
}
@end
