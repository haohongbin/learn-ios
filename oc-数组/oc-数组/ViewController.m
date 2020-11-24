//
//  ViewController.m
//  oc-数组
//
//  Created by hhb on 2020/10/27.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //数组里面放对象，可以放任意类型的对象
    //不可变数组
//    NSArray *array = [[NSArray alloc]init];
    NSArray *array = [[NSArray alloc]initWithObjects:@"a",@"b",@"c", nil];
    NSLog(@"array = %@",array);
    
    NSArray *array2 = [[NSArray alloc]initWithArray:array];
    NSLog(@"array2 = %@",array2);
    
    NSArray *array3 = [NSArray arrayWithArray:array2];
    NSLog(@"array3 = %@",array3);
    
    NSArray *array4 = [NSArray array];
    NSLog(@"array4 = %@",array4);
    
    
    //可变数组
    NSMutableArray *array5 = [[NSMutableArray alloc]init];//空的可变数组
    NSString *a = @"111";
    NSString *b = @"222";
    [array5 addObject:b];
    NSLog(@"array5 = %@",array5);
    
    NSMutableArray *array6 = [NSMutableArray array];//类方法形式创建数组
    NSLog(@"array6 = %@",array6);
    NSMutableArray *array7 = [NSMutableArray arrayWithCapacity:100];//长度为100的可变数组
    NSLog(@"array7 = %@",array7);
    NSMutableArray *array8 = [NSMutableArray arrayWithObjects:@"1",@"2",@"3", nil];//初始化添加对象，nil是占位符
    NSLog(@"array8 = %@",array8);
    NSMutableArray *array9 = [[NSMutableArray alloc]initWithArray:array];//以一个数组来创建新的数组
    NSLog(@"array9 = %@",array9);
    
    //操作可变数组
    [array5 addObject:[NSNumber numberWithInteger:10]];
    [array5 addObjectsFromArray:array];//添加多个元素
    NSLog(@"array5 = %@",array5);
    
    [array5 removeObject:@"a"];//删除所有跟参数相同的对象
    NSLog(@"array5 = %@",array5);
    
    [array5 removeObjectAtIndex:1];//删除指定位置的元素
    NSLog(@"array5 = %@",array5);
    
//    [array5 removeLastObject];//删除最后一个元素
    NSLog(@"array5 = %@",array5);
    
    //删除多个元素
//    [array5 removeObjectsInArray:array];
    NSLog(@"array5 = %@",array5);
    
    //从下标开始，删除几个元素  从下标0开始删除 要删除两个
    NSRange range = NSMakeRange(0, 2);
    [array5 removeObjectsInRange:range];
    NSLog(@"array5 = %@",array5);
    
    //删除所有元素
    //如果是空数组 调用下面这个方法数据会报错
    [array5 removeAllObjects];
    NSLog(@"array5 = %@",array5);
}


@end
