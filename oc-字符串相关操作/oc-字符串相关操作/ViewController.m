//
//  ViewController.m
//  oc-字符串相关操作
//
//  Created by hhb on 2020/10/26.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)NSString *name;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.name = @"111ffff";
    NSString *str = @"aaa";
    NSString *str1 = [[NSString alloc]init];
    str1 = @"";
    NSLog(@"str = %@,str1 = %@",str,str1);
    
    //字符串侧的操作
    //截取
    //重头开始截取
    NSString *s1 = @"HeadCenterEndCCC";
    NSString *tempStr = [s1 substringToIndex:4];
    NSLog(@"tempStr = %@",tempStr);
    
    //截取尾部
    NSString *tempStr1 = [s1 substringFromIndex:s1.length - 3];
    NSLog(@"tempStr1 = %@",tempStr1);
    
    //截取中间的一个区域字符
    NSRange range;
    range.location = 4;
    range.length = 6;
    NSString *tempStr2 = [s1 substringWithRange:range];
    NSLog(@"tempStr2 = %@",tempStr2);
    
    //替换字符串中的字符
    NSString *tempStr3 = [s1 stringByReplacingOccurrencesOfString:@"C" withString:@"A"];
    NSLog(@"tempStr3 = %@",tempStr3);
    
    //替换某一段字符
    NSRange range1 = NSMakeRange(4, 8);
    NSString *tempStr4 = [s1 stringByReplacingCharactersInRange:range1 withString:@"Middle11"];
    NSLog(@"tempStr4 = %@",tempStr4);
    
    //分割字符串
    NSString *s2 = @"111,222,333,444";
    NSArray *tempArray = [s2 componentsSeparatedByString:@","];
    NSLog(@"tempArray = %@",tempArray);
    
    NSString *s3 = @"name:xiaoming;age:11;height:170";
    NSArray *tempArray2 = [s3 componentsSeparatedByString:@";"];
    NSLog(@"tempArray2 = %@",tempArray2);
    
    //字符串的拼接
    NSString *s4 = @"1111";
    NSString *s5 = @"2222";
    NSString *tempStr5 = [NSString stringWithFormat:@"%@-%@",s4,s5];
    NSLog(@"tempStr5 = %@",tempStr5);
    
    NSString *phoneNumber = @"123456";
    NSString *resultStr = [NSString stringWithFormat:@"手机号码：%@",phoneNumber];
    NSLog(@"resultStr = %@",resultStr);
    
    int a = 5;
    NSString *tempStr6 = [NSString stringWithFormat:@"%@%d",s4,a];
    NSLog(@"tempStr6 = %@",tempStr6);
}


@end
