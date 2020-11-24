//
//  ViewController.m
//  UIDatePicker
//
//  Created by hhb on 2020/11/6.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//UIDatePicker日期组件
@property(nonatomic,strong)UIDatePicker *datePicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    
    [self.view addSubview:self.datePicker];
    
    [self.datePicker addTarget:self action:@selector(dataChange:) forControlEvents:UIControlEventValueChanged];
    //设置DatePicker的允许的最小日期
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:86400];
    //设置DatePicker的允许的最大日期
    self.datePicker.maximumDate = [NSDate dateWithTimeIntervalSinceNow:172800];
    //UIDatePickerModeTime, //只有时间选择的模式
//    UIDatePickerModeDate, //只有日期选择的模式
//    UIDatePickerModeDateAndTime, //既有时间又有日期的选择模式（默认这种）
//    UIDatePickerModeCountDownTimer //倒计时器模式
    [self.datePicker setDatePickerMode:UIDatePickerModeDateAndTime];
}

- (void)dataChange:(UIDatePicker *)sender{
    NSLog(@"sender.date = %@",sender.date);
}
@end
