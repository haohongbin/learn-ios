//
//  ViewController.m
//  ViewController的生命周期
//
//  Created by hhb on 2020/11/11.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//构造方法肯定是第一被调用的
//没有被调用是因为此init不是由ViewController构造的，而是由Main.storyboard构造的
- (instancetype)init{
    self = [super init];
    if (self) {
        NSLog(@"调用1");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    //生命周期
    //一般做UI的初始化
    //uilabel
    NSLog(@"调用2");
}
//系统系统调用
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"将要显示");
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"已经显示");
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"将要消失");
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"已经消失");
}

- (void)dealloc
{
    NSLog(@"释放");
}
//点击屏幕触发
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    FirstViewController *vc = [[FirstViewController alloc]init];
    //模态，没有NavigationController不能用push
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}


@end
