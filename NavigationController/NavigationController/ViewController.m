//
//  ViewController.m
//  NavigationController
//
//  Created by hhb on 2020/11/11.
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
    //NavigationController是容器，用来统一管理ViewController 
    self.view.backgroundColor = [UIColor redColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    FirstViewController *vc = [[FirstViewController alloc]init];
    //初始化UINavigationController需要initWithRootViewController（给一个根视图），容器必须告诉它第一个试图是啥
    UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:vc];
    
    [nc.navigationBar setTranslucent:NO];
    
    [self presentViewController:nc animated:YES completion:^{
        
    }];
    
}

@end
