//
//  ViewController.m
//  认识app页面 UIViewController
//
//  Created by hhb on 2020/10/29.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//ViewController是根试图，页面不会释放
//生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //用来写一些初始化，创建UI组件
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"初始化");
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    NSLog(@"页面将要出现");
}

- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    NSLog(@"页面已经出现");
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"页面将要消失");
}

- (void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    NSLog(@"页面已经消失");
}

//点击空白区域可以触发点击事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    FirstViewController *first = [[FirstViewController alloc]init];
    [self.navigationController pushViewController:first animated:YES];
}

- (void)dealloc{
    NSLog(@"页面释放");
}
@end
