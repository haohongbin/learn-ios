//
//  ViewController.m
//  UISwitch
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
    //UISwitch滑动开关
    UISwitch *mySwitch = [[UISwitch alloc]init];
    //yes 默认开启
    mySwitch.on = YES;
    mySwitch.tintColor = [UIColor redColor];//关闭状态的边框颜色
    mySwitch.onTintColor = [UIColor yellowColor];
    mySwitch.thumbTintColor = [UIColor blueColor];
    [self.view addSubview:mySwitch];
    mySwitch.frame = CGRectMake(100, 100, 300, 300);
    
    [mySwitch addTarget:self action:@selector(click) forControlEvents:UIControlEventValueChanged];
}

- (void)click{
    NSLog(@"触发");
    
}
@end
