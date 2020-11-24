//
//  ViewController.m
//  UIButton
//
//  Created by hhb on 2020/11/2.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //一般用UIButton的类方法进行构造
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];//UIButtonTypeCustom自定义类型
    [button setTitle:@"我是按钮" forState:UIControlStateNormal];//UIControlStateNormal正常状态
    [button setTitle:@"高亮" forState:UIControlStateHighlighted];
    
    UIColor *color = [UIColor redColor];
    
    [button setBackgroundColor:color];
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];//grayColor灰色 高亮状态是灰色 
    //给button添加事件 UIControlEventTouchUpInside点击按钮抬起时触发
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    //将button作为u.view的子视图
    [self.view addSubview:button];
    
    button.frame = CGRectMake(0, 0, 100, 100);
    
}

- (void)buttonClick:(UIButton *)sender{
    NSLog(@"按钮触发");
}

@end
