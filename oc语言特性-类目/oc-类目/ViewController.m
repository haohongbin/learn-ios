//
//  ViewController.m
//  oc-类目
//
//  Created by hhb on 2020/10/27.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"
#import "NSString+GetName.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *str = @"test";
    NSString *name = [str getName];
    NSInteger age = [str getAge];
    NSLog(@"name = %@;age = %ld",name,(long)age);
}


@end
