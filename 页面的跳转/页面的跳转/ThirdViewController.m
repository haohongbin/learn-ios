//
//  ThirdViewController.m
//  页面的跳转
//
//  Created by hhb on 2020/11/12.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ThirdViewController.h"
#import "FirstViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    self.title = @"Third";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:button];
    button.frame = CGRectMake(0, 100, 100, 40);
    [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)back:(UIButton *)sender{
//    [self.navigationController popViewControllerAnimated:YES];//返回到上级页面
//    [self.navigationController popToRootViewControllerAnimated:YES];//返回到根视图
    for (UIViewController *tmpVC in self.navigationController.viewControllers) {
        if ([tmpVC isKindOfClass:[FirstViewController class]]) {
            [self.navigationController popToViewController:tmpVC animated:YES];
            break;
        }
    }
}


@end
