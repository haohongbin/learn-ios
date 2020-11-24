//
//  ViewController.m
//  UITextView
//
//  Created by hhb on 2020/11/4.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextViewDelegate>
//UITextView文本框
@property(nonatomic,strong)UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.textView = [[UITextView alloc]init];
    self.textView.delegate = self;
    
    self.textView.textColor = [UIColor blackColor];
    
    self.textView.layer.borderWidth = 0.5;
    
    self.textView.layer.borderColor = [UIColor redColor].CGColor;
    
    [self.view addSubview:self.textView];
    
    self.textView.frame = CGRectMake(20, 200, 300, 200);
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    NSLog(@"开始编辑");
    return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    NSLog(@"结束编辑 = %@",textView.text);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.textView resignFirstResponder];
}

@end
