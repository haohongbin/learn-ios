//
//  SecondViewController.m
//  NavigationController
//
//  Created by hhb on 2020/11/11.
//  Copyright © 2020 edz. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
    self.title = @"Second";
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonSystemItemEdit target:self action:@selector(edit:)];
    
    UIButton *editButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [editButton setTitle:@"自定义的编辑" forState:UIControlStateNormal];
    [editButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [editButton setBackgroundColor:[UIColor yellowColor]];
    [editButton addTarget:self action:@selector(edit:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithCustomView:editButton];
    
    self.navigationItem.rightBarButtonItem = item1;
}

- (void)edit:(UIBarButtonItem *)sender{
    NSLog(@"编辑");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
