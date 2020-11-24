//
//  ViewController.m
//  获取键盘高度
//
//  Created by hhb on 2020/11/17.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITextField *textField = [[UITextField alloc]init];
    textField.placeholder = @"测试";//灰色显示
    textField.borderStyle = UITextBorderStyleLine;// 设置边框样式，只有设置了才会显示边框样式
    [self.view addSubview:textField];
    textField.frame = CGRectMake(0, 20, self.view.frame.size.width, 44);
    textField.delegate = self;
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyborderWillShow:) name:UIKeyboardWillShowNotification object:nil];
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyborderWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)keyborderWillShow:(NSNotification *)sender{
    NSLog(@"键盘将要显示");
    NSDictionary *info = [sender userInfo];
    NSValue *aValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    CGFloat height = keyboardRect.size.height;
    CGFloat width = keyboardRect.size.width;
    NSLog(@"高度 = %f",height);
    NSLog(@"宽度 = %f",width);
    
}
//键盘退出时调用
- (void)keyborderWillHide:(NSNotification *)sender{
    NSLog(@"键盘将要消失");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];//取消UITextField的第一响应，这样就可以点击return收回键盘
    return YES;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
