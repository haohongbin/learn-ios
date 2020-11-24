//
//  ViewController.m
//  UIProgressView
//
//  Created by hhb on 2020/11/9.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //UIProgressView进度条控件
    UIProgressView *progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(100, 100, 200, 40)];
    progressView.progress = 0.5;//设置进度条的起始位置
    progressView.progressTintColor = [UIColor redColor];//设置进度颜色
    progressView.trackTintColor = [UIColor greenColor];//设置进度条的轨道颜色
    progressView.progressViewStyle = UIProgressViewStyleBar;//标准进度条
    
    [self.view addSubview:progressView];
}


@end
