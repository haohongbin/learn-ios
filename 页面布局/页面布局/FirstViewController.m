//
//  FirstViewController.m
//  页面布局
//
//  Created by hhb on 2020/11/13.
//  Copyright © 2020 edz. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    NSLog(@"宽2 = %f;高2 = %f",self.view.frame.size.width,self.view.frame.size.height);
    
    NSLog(@"X2 = %f;Y2 = %f",self.view.frame.origin.x,self.view.frame.origin.y);
    
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 64, 100, 100);
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    NSLog(@"宽3 = %f;高3 = %f",self.view.frame.size.width,self.view.frame.size.height);
    
    NSLog(@"X3 = %f;Y3 = %f",self.view.frame.origin.x,self.view.frame.origin.y);
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
