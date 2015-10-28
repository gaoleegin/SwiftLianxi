//
//  ViewController.m
//  block和冒泡排序的继续使用
//
//  Created by 高李军 on 15/10/28.
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
    
    //冒泡排序走起
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@1,@7,@3,@1, nil];
    
    [self bubbleSort:array];
    
}

-(NSArray *)bubbleSort:(NSMutableArray *)mutaArray{
    
    
    for (int i = 0; i<mutaArray.count; i++) {
        for (int j = 0; j<mutaArray.count-i-1; j++) {
            if (mutaArray[j]  < mutaArray[j+1] ) {
                NSInteger temp = [mutaArray[j] integerValue];
                mutaArray[j] = mutaArray[j+1];
                mutaArray[j+1] = [NSNumber numberWithInteger:temp];
            }
        }
    }
    
    NSLog(@"=========%@",mutaArray);
    
    return mutaArray;
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Next" bundle:nil];
    NextViewController *VC = sb.instantiateInitialViewController;
    __weak __typeof(&*self)weakself = self;
    VC.myBlock = ^(NSString *name){
        weakself.nameLabel.text = name;
    };
    [self presentViewController:VC animated:true completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
