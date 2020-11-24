//
//  ViewController.m
//  点击手势
//
//  Created by hhb on 2020/11/13.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"头像01"];
    [self.view addSubview:imageView];
//    imageView.frame = CGRectMake(0, 200, 100, 100);
    imageView.bounds = CGRectMake(0, 0, 100, 100);
    imageView.center = self.view.center;
    imageView.userInteractionEnabled = YES;//no 不能响应手势
    
    //点击手势 创建手势 使用initWithTarget:action:的方法创建
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    //设置属性
    //tap 手势一共两个属性，一个是设置轻拍次数，一个是设置点击手指个数
    //设置轻拍次数
    tapGesture.numberOfTapsRequired = 2;
    //设置手指个数
    tapGesture.numberOfTouchesRequired = 2;
    //别忘了添加到imageView上
    [imageView addGestureRecognizer:tapGesture];
}

- (void)tapClick:(UITapGestureRecognizer *)sender{
    NSLog(@"触发");
}

@end
