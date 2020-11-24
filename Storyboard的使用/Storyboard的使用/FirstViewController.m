//
//  FirstViewController.m
//  Storyboard的使用
//
//  Created by hhb on 2020/11/14.
//  Copyright © 2020 edz. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)click:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
