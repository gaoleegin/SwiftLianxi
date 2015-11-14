//
//  ViewController.m
//  09-冒泡排序和block
//
//  Created by 高李军 on 15/11/13.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

@interface ViewController () <NextViewControllerDelegate>
- (IBAction)nextVC:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /**
     *  写一个冒泡排序，冒泡排序和block
     *
     *  @return
    
     */
    
    
    
    
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(returnDataFromNotification) name:@"LJTextNotification" object:nil];
    
    
    typedef void (^myBlock)(NSString *title) ;
    
    NSLog(@"第一");
    
    
    myBlock myblock = ^(NSString *title){
        NSLog(@"第二");
        NSLog(@"%@",title);
    };
    
    NSLog(@"第三");
    
    myblock(@"hello world");
    
    NSLog(@"第四");
    
    
    NSLog(@"返回来的数组%@",[self bubbleSort:[NSMutableArray arrayWithObjects:@1,@4,@56,@35, nil]]);
    
}

/**
 *  通知回来的数据
 *  自己对通知的理解：在创建通知的时间，要让所有的对象都存在，不可以有不存在的东西，如果一个对象还没有存在内存里面，那么，这个对象就是接收不到通知！
 *
 *  在最恰当的时间注册通
 * 
 */


-(void)returnDataFromNotification{
    NSLog(@"通知");
}


-(NSArray *)bubbleSort:(NSMutableArray *)mutaArray{
    
    for (int i = 0; i<mutaArray.count; i++) {
        for (int j = 0; j<mutaArray.count - i - 1; j++) {
            if ([mutaArray[j] integerValue] < [mutaArray[j+1] integerValue]) {
                NSInteger temp = [mutaArray[j+1] integerValue];
                mutaArray[j+1] = mutaArray[j];
                mutaArray[j] = [NSNumber numberWithInteger:temp];
            }
        }
    }
    return [mutaArray copy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextVC:(UIBarButtonItem *)sender {
    
    NextViewController *nextVC = [[NextViewController alloc]init];
    
    nextVC.delegate = self;
    
    __weak __typeof(&*self)weakSelf = self;
    nextVC.returnBlock = ^NSString*(NSString *title){
        weakSelf.titleLabel.text = title;
        return @"是从第一个控制器放回回来的";
    };
    
    [self.navigationController pushViewController:nextVC animated:YES];
}

-(void)theNextVCtouchBegin:(NextViewController *)nextVC{
    self.title = @"我是代理调用回来的";
}

-(void)dealloc{
    NSLog(@"我就这样车了");
}

@end
