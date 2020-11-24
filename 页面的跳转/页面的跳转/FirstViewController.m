//
//  FirstViewController.m
//  页面的跳转
//
//  Created by hhb on 2020/11/12.
//  Copyright © 2020 edz. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"First";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    button.frame = CGRectMake(0, 100, 100, 40);
    [button setBackgroundColor:[UIColor whiteColor]];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"跳转" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    button1.frame = CGRectMake(0, 200, 100, 40);
    [button1 setBackgroundColor:[UIColor whiteColor]];
    [button1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
}

- (void)back:(UIButton *)sender{
    //我们都知道dismissViewControllerAnimated:completion:方法是针对被present出来的控制器的，一般我们这样使用：在一个控制器中present另外一个控制器A，然后在A中执行dismissViewControllerAnimated:completion:让自己消失。
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)push:(UIButton *)sender{
    SecondViewController *second = [[SecondViewController alloc]init];
    
    [self.navigationController pushViewController:second animated:YES];
}

@end
