//
//  ViewController.m
//  多控制器的切换
//
//  Created by 高李军 on 15/12/28.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "ViewController.h"
#import "LJFirstViewController.h"
#import "LJSecondViewController.h"
#import "LJThirdViewController.h"

@interface ViewController ()

@property (nonatomic ,strong) LJFirstViewController  *firstVC;
@property (nonatomic ,strong) LJSecondViewController  *secondVC;
@property (nonatomic ,strong) LJThirdViewController *thirdVC;

@property (nonatomic ,strong) UIViewController *currentVC;

@property (nonatomic ,strong) UIScrollView *headScrollView;  //  顶部滚动视图

@property (nonatomic ,strong) NSArray *headArray;


@endq

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"网易新闻Demo";
    
    self.headArray = @[@"头条",@"娱乐",@"体育",@"财经",@"科技",@"NBA",@"手机"];
    
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.headScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, 320, 40)];
    self.headScrollView.backgroundColor = [UIColor purpleColor];
    self.headScrollView.contentSize = CGSizeMake(560, 0);
    self.headScrollView.bounces = NO;
    self.headScrollView.pagingEnabled = YES;
    [self.view addSubview:self.headScrollView];
    for (int i = 0; i < [self.headArray count]; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(0 + i*80, 0, 80, 40);
        [button setTitle:[self.headArray objectAtIndex:i] forState:UIControlStateNormal];
        button.tag = i + 100;
        [button addTarget:self action:@selector(didClickHeadButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.headScrollView addSubview:button];
    }
    
    self.firstVC = [[LJFirstViewController alloc] init];
    [self.firstVC.view setFrame:CGRectMake(0, 104, 320, 464)];
    [self addChildViewController:_firstVC];
    
    self.secondVC = [[LJSecondViewController alloc] init];
    [self.secondVC.view setFrame:CGRectMake(0, 104, 320, 464)];
    
    self.thirdVC = [[LJThirdViewController alloc] init];
    [self.thirdVC.view setFrame:CGRectMake(0, 104, 320, 464)];
    
    //  默认,第一个视图(你会发现,全程就这一个用了addSubview)
    [self.view addSubview:self.firstVC.view];
    self.currentVC = self.firstVC;
    
}

- (void)didClickHeadButtonAction:(UIButton *)button
{
    //  点击处于当前页面的按钮,直接跳出
    if ((self.currentVC == self.firstVC && button.tag == 100)||(self.currentVC == self.secondVC && button.tag == 101.)) {
        return;
    }else{
        
        //  展示2个,其余一样,自行补全噢
        switch (button.tag) {
            case 100:
                [self replaceController:self.currentVC newController:self.firstVC];
                break;
            case 101:
                [self replaceController:self.currentVC newController:self.secondVC];
                break;
            case 102:
                //.......
                break;
            case 103:
                //.......
                break;
            case 104:
                //.......
                break;
            case 105:
                //.......
                break;
            case 106:
                //.......
                break;
                //.......
            default:
                break;
        }
    }
    
}

//  切换各个标签内容
- (void)replaceController:(UIViewController *)oldController newController:(UIViewController *)newController
{
    /**
     *			着重介绍一下它
     *  transitionFromViewController:toViewController:duration:options:animations:completion:
     *  fromViewController	  当前显示在父视图控制器中的子视图控制器
     *  toViewController		将要显示的姿势图控制器
     *  duration				动画时间(这个属性,old friend 了 O(∩_∩)O)
     *  options				 动画效果(渐变,从下往上等等,具体查看API)
     *  animations			  转换过程中得动画
     *  completion			  转换完成
     */
    
    [self addChildViewController:newController];
    [self transitionFromViewController:oldController toViewController:newController duration:0.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        
        if (finished) {
            
            [newController didMoveToParentViewController:self];
            [oldController willMoveToParentViewController:nil];
            [oldController removeFromParentViewController];
            self.currentVC = newController;
            
        }else{
            
            self.currentVC = oldController;
            
        }
    }];
}

@end
