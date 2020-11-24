//
//  ViewController.m
//  UIToolBar
//
//  Created by hhb on 2020/11/6.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //UIToolBar工具栏
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    //选择风格，这里我们选择黑色风格
    toolBar.barStyle = UIBarStyleBlack;
    
    toolBar.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:toolBar];
    //添加按钮和按钮之间的间距，这些都被对象化了，按钮是可以实现方法的
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction:)];
    
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:NULL];
    
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAction)];
    
    [toolBar setItems:@[cancelItem,spaceItem,addItem] animated:YES];
}

- (void)cancelAction:(UIBarButtonItem *)sender{
    NSLog(@"取消");
}

- (void)addAction{
    NSLog(@"添加");
}

@end
