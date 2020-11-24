//
//  ViewController.m
//  UISlider
//
//  Created by hhb on 2020/11/9.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//UISlider滑动控件
@property(nonatomic,strong)UISlider *slider;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.slider = [[UISlider alloc]initWithFrame:CGRectMake(100, 100, 200, 30)];
    self.slider.minimumTrackTintColor = [UIColor greenColor];
    self.slider.maximumTrackTintColor = [UIColor redColor];
    
    
    self.slider.continuous = NO;//默认YES  如果设置为NO，则每次滑块停止移动后才触发事件
    [self.slider setThumbImage:[UIImage imageNamed:@"椭圆5"] forState:UIControlStateNormal];//给滑动按钮设置图片
    
    [self.slider addTarget:self action:@selector(changeProgress:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.slider];
    
}

- (void)changeProgress:(UISlider *)sender{
    NSLog(@"进度 = %f",sender.value);
}
@end
