//
//  pushViewcontroller.m
//  自定义转场动画
//
//  Created by 高李军 on 15/11/25.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "pushViewcontroller.h"

@interface pushViewcontroller ()

@end

@implementation pushViewcontroller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"push" style:UIBarButtonItemStylePlain target:self action:@selector(push)];

    
    
}

-(void)push{
    pushViewcontroller *pushVC = [[pushViewcontroller alloc]init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
