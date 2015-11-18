//
//  ViewController.m
//  ReactiveSecondLianXi
//
//  Created by 高李军 on 15/11/18.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveCocoa.h"
#import "LJLoginService.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (weak, nonatomic) IBOutlet UIButton *logingBtn;

@property(nonatomic,strong)LJLoginService *service;

@end

@implementation ViewController


-(LJLoginService *)service{
    if (_service==nil) {
        _service = [[LJLoginService alloc]init];
    }
    return _service;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //ReactiveCocoa开始使用，本质就是添加分类，真的就是添加分类
    
    //可以监听文本框的输入的数据，在这有一个需求就是返回的值是文本框字符串输入的长度
    RACSignal *userNameSignale = [[[self.usernameField rac_textSignal] map:^id(NSString *text) {
        return @([self isvalidUserName]); //在这里就是将文本框字符串的长度返回了回去
    }] map:^id(NSNumber *validuserName) {
        return [validuserName boolValue]?[UIColor redColor]:[UIColor clearColor];
    }];
    
    RACSignal *passwordSignal = [[[self.passwordField rac_textSignal] map:^id(id value) {
        return @([self isvalidPassword]);
    }] map:^id(NSNumber *isvalidPassWord) {
        return [isvalidPassWord boolValue]?[UIColor redColor]:[UIColor clearColor];
    }];
    
    //通过上面的几行引出来一个RAC
    RAC(self.usernameField,backgroundColor) = [userNameSignale map:^id(UIColor *color) {
        return color;
    }];
    
    RAC(self.passwordField,backgroundColor) = [passwordSignal map:^id(UIColor *color) {
        return color;
    }];
    
    
    //这里的逻辑有一些混乱
    RACSignal *combineSignal = [RACSignal combineLatest:@[userNameSignale,passwordSignal] reduce:^id(UIColor *usnamaColor,UIColor *passWordColor){
        return @((usnamaColor==[UIColor redColor])&&([UIColor redColor]==passWordColor));
    }];
    
    
    //根据两个文本框来确定按钮的点击状态
    [combineSignal subscribeNext:^(NSNumber *isenable) {
        self.logingBtn.enabled = [isenable boolValue];
    }];

    //给按钮添加点击信号
    [[self.logingBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"按钮已经惦记了");
        
        [[self getSigna] subscribeNext:^(id x) {
            NSLog(@"====返回来的东西========%@",x);
        }];
        
        
    }];
}


-(RACSignal *)getSigna{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [self.service sigInWithuserNam:self.usernameField.text password:self.usernameField.text complete:^(BOOL success) {
            
            //执行完这个方法的时间然后调用这个block，二这个block已经有一个参数了，就是
            
            [subscriber sendNext:@(success)];
            [subscriber sendCompleted];
        }];
        
        return nil;
    }];
}

-(BOOL)isvalidUserName{
    return self.usernameField.text.length > 3;
}

-(BOOL)isvalidPassword{
    return self.passwordField.text.length > 3;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
