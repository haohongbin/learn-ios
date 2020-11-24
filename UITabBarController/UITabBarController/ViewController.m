//
//  ViewController.m
//  UITabBarController
//
//  Created by hhb on 2020/11/12.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //tabbarController  最大
    //navigationControlelr
    //里面放的是viewcontroller
    FirstViewController *first = [[FirstViewController alloc]init];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:first];
    [nav1.navigationBar setTranslucent:NO];//设置为“否”来强制设置不透明背景
    nav1.title = @"First";
    nav1.tabBarItem.image = [UIImage imageNamed:@"home_discovergray"];
    nav1.tabBarItem.selectedImage = [UIImage imageNamed:@"home_discovegreen"];
//    UIImage *nav1DefImage = [UIImage imageNamed:@"home_discovergray"];
//    nav1DefImage = [nav1DefImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//
//    UIImage *nav1SelectedImage = [UIImage imageNamed:@"home_discovegreen"];
//    nav1SelectedImage = [nav1SelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//
//    nav1.tabBarItem.image = nav1DefImage;
//    nav1.tabBarItem.selectedImage = nav1SelectedImage;
    
    
    SecondViewController *second = [[SecondViewController alloc]init];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:second];
    nav2.title = @"Second";
    nav2.tabBarItem.image = [UIImage imageNamed:@"home_personalgray"];
    nav2.tabBarItem.selectedImage = [UIImage imageNamed:@"home_personalgreen"];
    
    
    ThirdViewController *third = [[ThirdViewController alloc]init];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:third];
    nav3.title = @"Third";
    nav3.tabBarItem.image = [UIImage imageNamed:@"home_studygray"];
    nav3.tabBarItem.selectedImage = [UIImage imageNamed:@"home_studygreen"];
    
    
    
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    tabBarController.viewControllers = @[nav1,nav2,nav3];
    tabBarController.tabBar.translucent = NO;
    
    //设置字体颜色 lightGrayColor浅灰色
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]} forState:UIControlStateNormal];

    [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateSelected];
    
    [self presentViewController:tabBarController animated:YES completion:^{
        
    }];
}


@end
