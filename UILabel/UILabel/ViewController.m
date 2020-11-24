//
//  ViewController.m
//  UILabel
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
    //UILabel是一个标签 主要用来放一些文字
    UILabel *label = [[UILabel alloc]init];
    label.text = @"我是label标签";
    label.font = [UIFont systemFontOfSize:20];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor redColor];//背景色
    label.numberOfLines = 0;//0不限制行数 1为1行
    label.textAlignment = NSTextAlignmentCenter;//居中显示
    
    [self.view addSubview:label];
    
    label.frame = CGRectMake(20, 20, 100, 100);
    
}


@end
