//
//  ViewController.m
//  oc-数据类型
//
//  Created by hhb on 2020/10/26.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //int
    //char
    //array
    //字符串 nsstring
    //NSInteger   int
    //CGFloat     float
    //nsrange 范围
    //NSNumber 对象
    //数组
    //字典
    //Bool
    
    NSInteger a;
    a = 1;
    NSInteger b = 2;
    
    CGFloat c = 1.3;
    CGFloat d;
    d = 1.4;
    
//    NSNumber *number = [[NSNumber alloc]init];
    NSNumber *number = [NSNumber numberWithInteger:10];
    NSLog(@"number = %@",number);
    
    b = a + number.integerValue;
    NSLog(@"b = %ld",(long)b);
    
    NSNumber *number1 = [NSNumber numberWithFloat:1.6];
    c = c + number1.floatValue;
    NSLog(@"c = %f",c);
    
    NSNumber *number2 = [NSNumber numberWithBool:YES];
    NSLog(@"number2 = %@",number2);
    BOOL m = number2.boolValue;
    NSLog(@"m = %d",m);
    
    NSString *str = @"100";
    NSInteger n = str.integerValue;
    NSLog(@"n = %d",n);
}


@end
