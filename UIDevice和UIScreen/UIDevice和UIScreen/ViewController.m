//
//  ViewController.m
//  UIDevice和UIScreen
//
//  Created by hhb on 2020/11/14.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIDevice *currentDevice = [UIDevice currentDevice];
    NSLog(@"设备名称：%@",currentDevice.name);
    NSLog(@"设备模式：%@",currentDevice.model);
    NSLog(@"本地设备模式：%@",currentDevice.localizedModel);
    NSLog(@"系统名称：%@",currentDevice.systemName);
    NSLog(@"系统版本号：%@",currentDevice.systemVersion);
    NSLog(@"UUID：%@",currentDevice.identifierForVendor.UUIDString);
    NSLog(@"当前系统是否支持多任务：%d",currentDevice.multitaskingSupported);
    NSLog(@"设备类型：%ld",(long)currentDevice.userInterfaceIdiom);//设备类型
    
    UIScreen *screen =[UIScreen mainScreen];
    NSLog(@"修改屏幕亮度前 = %f",screen.brightness);
    screen.brightness = 1;
    NSLog(@"修改屏幕亮度后 = %f",screen.brightness);
    NSLog(@"屏幕宽度 = %f",screen.bounds.size.width);
    NSLog(@"屏幕高度 = %f",screen.bounds.size.height);
}


@end
