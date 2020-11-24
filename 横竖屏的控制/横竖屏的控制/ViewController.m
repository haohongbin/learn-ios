//
//  ViewController.m
//  横竖屏的控制
//
//  Created by hhb on 2020/11/13.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"
#import "UIDevice+Direction.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"旋转" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.frame = CGRectMake(0, 200, self.view.frame.size.width, 30);
    [button setBackgroundColor:[UIColor redColor]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (void)action:(UIButton *)sender{
    ((AppDelegate *)[UIApplication sharedApplication].delegate).allowRotation = YES;
    [UIDevice setNewOrientation:UIInterfaceOrientationLandscapeRight];
}

@end
