//
//  ViewController.m
//  UISegmentControl
//
//  Created by hhb on 2020/11/9.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *data = @[@"1",@"2",@"3"];
    //UISegmentedControl分段控件提供一栏按钮（有时称为按钮栏
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:data];
    
    [segment addTarget:self action:@selector(click:) forControlEvents:UIControlEventValueChanged];
    
    [segment insertSegmentWithTitle:@"4" atIndex:3 animated:YES];
    
    [segment removeSegmentAtIndex:0 animated:YES];
    
    [segment setTintColor:[UIColor greenColor]];
    
    [segment setBackgroundColor:[UIColor redColor]];
    
    [self.view addSubview:segment];
    
    segment.frame = CGRectMake(20, 20, 200, 44);
}

- (void)click:(UISegmentedControl *)sender{
    NSLog(@"第%ld个",(long)sender.selectedSegmentIndex);
}
@end
