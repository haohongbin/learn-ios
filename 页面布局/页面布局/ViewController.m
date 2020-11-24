//
//  ViewController.m
//  页面布局
//
//  Created by hhb on 2020/11/13.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
    纯代码布局--计算frame（特别繁琐，不易维护）；
    纯代码布局--使用Masonry第三方库；
    storyboard布局（加载慢，简单项目vc不是很多的情况下，可以考虑使用）；
    一般用代码masonry 适当结合xib等混合布局
    */
    NSLog(@"宽 = %f;高 = %f",self.view.frame.size.width,self.view.frame.size.height);

    NSLog(@"X = %f;Y = %f",self.view.frame.origin.x,self.view.frame.origin.y);//原点
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    NSLog(@"宽1 = %f;高1 = %f",self.view.frame.size.width,self.view.frame.size.height);
    
    NSLog(@"X1 = %f;Y1 = %f",self.view.frame.origin.x,self.view.frame.origin.y);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    FirstViewController *first = [[FirstViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:first];
    [nav.navigationBar setTranslucent:YES];//no不透明 高度会少一个导航栏的高度
    
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}


@end
