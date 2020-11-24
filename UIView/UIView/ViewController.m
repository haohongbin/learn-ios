//
//  ViewController.m
//  UIView
//
//  Created by hhb on 2020/11/4.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIView *customView = [[UIView alloc]init];
    customView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:customView];
    
    customView.frame = CGRectMake(0, 0, 100, 100);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor whiteColor]];
    [customView addSubview:button];
    
    button.frame = CGRectMake(0, 0, customView.frame.size.width, 30);
}


@end
