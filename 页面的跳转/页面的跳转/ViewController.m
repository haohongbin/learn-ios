//
//  ViewController.m
//  页面的跳转
//
//  Created by hhb on 2020/11/12.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    /*
    push与present都可以推出新的界面。
    present与dismiss对应，push和pop对应。
    present只能逐级返回，push所有视图由视图栈控制，可以返回上一级，也可以返回到根vc，其他vc。
    present一般用于不同业务界面的切换，push一般用于同一业务不同界面之间的切换
    */
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    FirstViewController *first = [[FirstViewController alloc]init];
    UINavigationController *nv = [[UINavigationController alloc]initWithRootViewController:first];
    
    [self presentViewController:nv animated:YES completion:^{
        
    }];
}

@end
