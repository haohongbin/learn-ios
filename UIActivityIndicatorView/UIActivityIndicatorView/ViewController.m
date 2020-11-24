//
//  ViewController.m
//  UIActivityIndicatorView
//
//  Created by hhb on 2020/11/4.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//UIActivityIndicatorView页面加载loading
@property(nonatomic,strong)UIActivityIndicatorView *activityIndicatorView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //UIActivityIndicatorViewStyleGray小一点黑色的
//    UIActivityIndicatorViewStyleWhiteLarge,   // 大一点的白色的
//    UIActivityIndicatorViewStyleWhite,  // 小一点的白色的
    self.activityIndicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    self.activityIndicatorView.color = [UIColor whiteColor];//设置小菊花颜色
    
    self.activityIndicatorView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.activityIndicatorView];
    
    self.activityIndicatorView.frame = CGRectMake(100, 100, 100, 100);
    //刚进入这个界面会显示控件，并且停止旋转也会显示，只是没有在转动而已，没有设置或者设置为YES的时候，刚进入页面不会显示
    self.activityIndicatorView.hidesWhenStopped = NO;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"开始1" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    button.frame = CGRectMake(100, 200, 50, 50);
}

-(void) buttonClick:(UIButton *)sender{
    [self.activityIndicatorView startAnimating];
}
//main.storyboard中选择assiatant，选中按钮按住control键拖过来就生成一个点击事件了
- (IBAction)start:(id)sender {
    [self.activityIndicatorView startAnimating];
}

- (IBAction)stop:(id)sender {
    [self.activityIndicatorView stopAnimating];
}

@end
