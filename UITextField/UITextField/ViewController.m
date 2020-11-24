//
//  ViewController.m
//  UITextField
//
//  Created by hhb on 2020/11/4.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>//遵守UITextFieldDelegate代理

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //UITextField 输入框
    UITextField *textField = [[UITextField alloc]init];
    textField.delegate = self;//代理 self就要实现该代理 require修饰的必须实现 optional修饰的可以实现也可以不实现
    textField.backgroundColor = [UIColor redColor];
    textField.textColor = [UIColor whiteColor];
    textField.font = [UIFont systemFontOfSize:18];
    /*UITextBorderStyleNone,
    UITextBorderStyleLine,
    UITextBorderStyleBezel,
    UITextBorderStyleRoundedRect
     */
    textField.borderStyle = UITextBorderStyleRoundedRect;// 设置边框样式，只有设置了才会显示边框样式
    
    textField.placeholder = @"请输入账户名";//输入框灰色提示
    
    [self.view addSubview:textField];
    
    textField.frame = CGRectMake(0, 50, self.view.frame.size.width, 50);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];//取消UITextField的第一响应，这样就可以点击return收回键盘
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"开始编辑");
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"编辑结束 = %@",textField.text);
}

@end
