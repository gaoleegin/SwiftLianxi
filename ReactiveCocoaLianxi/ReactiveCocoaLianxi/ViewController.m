//
//  ViewController.m
//  ReactiveCocoaLianxi
//
//  Created by 高李军 on 15/11/16.
//  Copyright © 2015年 高李军. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveCocoa.h"
#import "NexViewController.h"
#import "flagsModel.h"
#import "LJDummySignInService.h"


@interface ViewController ()

@property(nonatomic,strong)NSMutableArray *flags;

@property(nonatomic,strong)RACCommand *command;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property(strong,nonatomic) LJDummySignInService *service;

@end

@implementation ViewController


//验证用户名
-(BOOL)isValidUserName:(NSString *)userName{
    return userName.length > 3;
}

//验证密码
-(BOOL)isValidPassword:(NSString *)passWord{
    return passWord.length > 3;
}

-(RACSignal *)getsignal{
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [self.service signInWithUsername:self.username.text password:self.passWord.text complicate:^(BOOL success) {
            [subscriber sendNext:@"哈哈哈啊好"];
            [subscriber sendCompleted];
        }];
        return nil;
        
    }];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //换一种思路
    self.service = [[LJDummySignInService alloc]init];
    
    RACSignal *signal =  [self getsignal];
    
    //先就是发送一条消息，然后就是订阅是否成功，真的就是是否成功
//    [signal subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
    
    RACSignal *validUserNameSignal = [self.username.rac_textSignal map:^id(NSString *text) {
        return @([self isValidUserName:text]);
    }];
    
    RACSignal *validPasswordSignal = [self.passWord.rac_textSignal map:^id(NSString *text) {
        return @([self isValidPassword:text]);
    }];
    
    [validUserNameSignal map:^id(NSNumber *validuserName) {
        return [validuserName boolValue]?[UIColor clearColor]:[UIColor yellowColor];
    }];
    
    [validPasswordSignal map:^id(NSNumber *validPassword) {
        return [validPassword boolValue]?[UIColor clearColor]:[UIColor redColor];
    }];
    
    
    //RAC宏允许直接把信号的输出应用到对象的属性上。RAC宏有两个参数，第一个是需要设置属性值的对象，第二个是属性名。每次信号产生一个next事件，传递过来的值都会应用到该属性上。
    
    //RAC宏允许直接把信号的输出应用到对象的属性上面。RAC宏有两个参数，第一个数需要设置属性值的对象，第二个是属性名。每次信号产生一个next事件，传递过来的值都会应用到该属性上面。
    RAC(self.passWord,backgroundColor) = [validPasswordSignal map:^id(NSNumber *validPassword) {
        return [validPassword boolValue]?[UIColor clearColor]:[UIColor redColor];
    }];
    
    RAC(self.username,backgroundColor) = [validUserNameSignal map:^id(NSNumber *validUserName) {
        return [validUserName boolValue]?[UIColor clearColor]:[UIColor redColor];
    }];
    
    //
    
    RACSignal *upAcvivitySignal = [RACSignal combineLatest:@[validPasswordSignal,validUserNameSignal] reduce:^id(NSNumber *validUserName,NSNumber *validPassword){
        return @([validUserName boolValue]&&[validPassword boolValue]);
    }];
    
    [upAcvivitySignal subscribeNext:^(NSNumber *signUpActivity) {
        self.loginBtn.enabled = [signUpActivity boolValue];
    }];
    
    
//    //处理按钮点击事件,给按钮添加点击事件,block的参数是当前控件的一些信息
//    [[[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
//        
//    }] don]
    
    //[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside]
    
    
    
    //在这里进行消息的发送，监听,就是利用ReactiveCocoa进行文本输入框的监听
    //没有delegate，没有add target，有的只是signal，和block
    
    
    //ReactiveCocoa框架使用category来为很多基本UIKit控件添加signal。这样你就能给控件添加订阅了，text field的rac_textSignal就是这么来的。
    
    //ReactiveCocoa框架使用category来为很多的基本的UIKit控件添加signal。这样我就能给控件添加订阅了，text field的rac_textSignal就是这么来的！
    
    
//    
//    [self.username.rac_textSignal subscribeNext:^(id x) {
//        NSLog(@"==============%@",x);
//    }];
//    
//    [self.passWord.rac_newTextChannel subscribeNext:^(id x) {
//        NSLog(@"%@===========",x);
//    }];
    
    
    //这个不就是函数式编程，还有响应式编程，filter：过滤的意思
    
    //过程：rac_textSignal ->filter ->subscribeNext;信号不会被主动激活，只有在订阅的时间才会被激活
    //这个不就是响应式编程吗？
    
    //RACSignal每一步的操作都会返回一个RACSignal，这个术语叫做连贯接口（fluent interface）
    //连贯接口
    
//    [[self.username.rac_textSignal filter:^BOOL(NSString *text) {
//    
//        return text.length > 3;
//    }] subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
    
    //这个的具体步骤
    //1.map从上一个next拿到数据，通过执行block，把返回值返回个下一个next事件，map以NSString为输入，然后返回一个NSNumber为返回值。
    //可以利用map将数据转换为自己想要的数据，只要这个数据是一个对象。
    
    
    
//    [[[self.username.rac_textSignal map:^id(NSString *text) {
//        return @(text.length);
//    }] filter:^BOOL(NSNumber *length) {
//        return [length integerValue] >3;
//    }] subscribeNext:^(id x) {
//        NSLog(@"========%@",x);
//  、、  }];
    
    
    [[[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] map:^id(id value) {
        return [self getsignal];
    }] subscribeNext:^(RACSignal *signal) {
        [signal subscribeNext:^(NSString *str) {
            NSLog(@"=======%@",str);
        }];
    }];
    
    
    
    
//    RACSignal *signal =  [self.username.rac_textSignal filter:^BOOL(id value) {
//        NSString *text = value;
//        return text.length > 3;
//    }];
//    
//    [[signal doNext:^(id x) {
//        
//    }] subscribeNext:^(id x) {
//        
//    }];
//    
//    
//    
//    [signal subscribeNext:^(id x) {
//        NSLog(@"%@=========",x);
//    }];
    
//     subscribeNext:^(id x) {
//         NSLog(@"==========%@",x);
//    }];
}

-(void)demo8{
    //RACCommand的使用
    
    RACCommand *command = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        
        NSLog(@"执行命令");
        
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            [subscriber sendNext:@"请求数据"];
            
            [subscriber sendCompleted];
            
            
            return nil;
        }];
        
        
    }];
    
    _command = command;
    
    //订阅command中的信号
    [_command.executionSignals subscribeNext:^(id x) {
        [x subscribeNext:^(id x) {
            NSLog(@"%@",x);
        }];
    }];
    
    
    [self.command execute:@"hahahah"];
    

}


-(void)demo7{
    //使用RAC的写法
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil];
    
    
    NSArray *itemsArray = [NSArray arrayWithContentsOfFile:filePath];
    
    NSMutableArray *flags = [NSMutableArray array];
    
    _flags = flags;
    
    [itemsArray.rac_sequence.signal subscribeNext:^(id x) {
        
        flagsModel *model = [flagsModel flagsModelWithDict:x];
        [flags addObject:model];
        
    }];
    
    
    //高级用法。就是映射
    //map 就是转换一下，map就是遍历数组里面的所有的值，然后将这些值映射成新值
    //将转换完的值进行保存，转换为一个数组
    NSArray *flagss = [[itemsArray.rac_sequence map:^id(id value) {
        return [flagsModel flagsModelWithDict:value];
        
    }] array];

}

-(void)demo6{
    //字典转模型  最原始的OC的写法
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil];
    
    NSLog(@"===========%@",filePath);
    
    
    NSArray *diceArray = [NSArray arrayWithContentsOfFile:filePath];
    
    NSLog(@"%@",diceArray);
    
    NSMutableArray *items = [NSMutableArray array];
    
    for (NSDictionary *dict in diceArray) {
        //flagsModel *flagsModel = [flagsModel fl]
        
        flagsModel *flagsItem = [flagsModel flagsModelWithDict:dict];
        [items addObject:flagsItem];
    }
    

}



-(void)demo5{
    //RACTuple:元组类，类似于NSArray，用来包装值
    //RACSequence:RAC中的集合类，用于代替NSArray，NSDictioary，可以用来快速的遍历数组和字典
    
    
    NSDictionary *dict = @{@"name":@"hanmeimei",@"age":@18};
    
    [dict.rac_sequence.signal subscribeNext:^(id x) {
        
        //解包元组
        RACTupleUnpack(NSString *key,NSString *value) = x;
        
        NSLog(@"%@==%@",key,value);
        
    }];
}

/**
 *  RACSequence
 */

-(void)demo4{
    
    //RACSequence的简单使用，使用步骤
    //1.将数组转换为RACSequence numberssArray.rac_sequence
    //2.将集合RACSequence装转换为信号类，numberssArray.rac_sequence.signal
    //3.订阅信号，会自动激活信号，把集合中的所有的值遍历出来
    
    NSArray *numberssArray = @[@1,@3,@4,@5];
    [numberssArray.rac_sequence.signal subscribeNext:^(id x) {
        
    }];
}







-(void)demo3{
    UIButton *twoButton = [[UIButton alloc]init];
    twoButton.backgroundColor = [UIColor redColor];
    twoButton.frame = CGRectMake(0, 0, 100, 100);
    
    [twoButton addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:twoButton];
    
    
    
    
    RACReplaySubject *resubject =  [RACReplaySubject subject];
    
    //先进行发送信号
    [resubject sendNext:@[@1,@3,@4]];
    
    //订阅信号
    [resubject subscribeNext:^(id x) {
        NSLog(@"第一个信号已经被订阅%@",x);
    }];
    
    [resubject subscribeNext:^(id x) {
        NSLog(@"第二个信号已经被订阅%@",x);
    }];

}


-(void)btnClicked{
    NexViewController *next = [[NexViewController alloc]init];
    
    
    //ReactiveCocoa 顶替代理的使用
    next.delegateSignal = [RACSubject subject];
    [next.delegateSignal subscribeNext:^(id x) {
        NSLog(@"第二个按钮已经电解铝==%@",x);
    }];
    
    [self presentViewController:next animated:true completion:nil];
    
}

-(void)demo2{
    //创建信号
    RACSubject *subject = [RACSubject subject];
    
    //订阅信号
    [subject subscribeNext:^(id x) {
        NSLog(@"第一个订阅者%@",x);
    }];
    
    [subject subscribeNext:^(id x) {
        NSLog(@"第二个订阅者%@",x);
    }];
    
    //发出信号
    [subject sendNext:@1];
}


-(void)demo1{
    
    //signal:信号
    //subscribleer:订阅
    //
    
    
    
    
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@1];
        [subscriber sendCompleted];
        
        return [RACDisposable disposableWithBlock:^{
            
            NSLog(@"信号被销毁");
            
        }];
        
    }];
    
    RACSignal *signal1 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@1];
        [subscriber sendCompleted];
        
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"信号被屏蔽");
        }];
        
    }];
    
    
    [signal subscribeNext:^(id x) {
        NSLog(@"接收到的数据%@",x);
    }];
    
    [signal1 subscribeNext:^(id x) {
        NSLog(@"接收到的数据2%@",x);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
