//
//  ViewController.m
//  oc-字典
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
    //不可变字典
    NSDictionary *dic = [[NSDictionary alloc]init];
    NSDictionary *dic1 = [NSDictionary dictionaryWithObject:@"value01" forKey:@"key01"];
    NSLog(@"dic1 = %@",dic1);
    
    NSDictionary *dic2 = @{@"name":@"xiaomung",@"age":@"11"};
    NSLog(@"dic2 = %@",dic2);
    
    NSDictionary *dic3 = [NSDictionary dictionaryWithDictionary:dic2];
    NSLog(@"dic3 = %@",dic3);
    
    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:@"name",@"xiaoming",@"age",@"11", nil];
    NSLog(@"dic4 = %@",dic4);
    
    //可变字典
    NSMutableDictionary *dic5 = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *dic6 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"name",@"xiaoming",@"age",@"11", nil];
    NSLog(@"dic6 = %@",dic6);
    
    NSMutableDictionary *dic7 = [NSMutableDictionary dictionaryWithDictionary:dic2];
    NSLog(@"dic7 = %@",dic7);
    
    //操作可变字典
    //添加
    [dic5 setObject:@"xiaoming" forKey:@"name"];
    [dic5 setObject:@"12" forKey:@"age"];
    [dic5 setObject:@"170" forKey:@"height"];
    NSLog(@"dic5 = %@",dic5);
    
    //修改
    [dic5 setObject:@"xiaogang" forKey:@"name"];
    NSLog(@"dic5 = %@",dic5);
    
    //删除
//    [dic5 removeObjectForKey:@"name"];
//    NSLog(@"dic5 = %@",dic5);
//    [dic5 removeAllObjects];
//    NSLog(@"dic5 = %@",dic5);
    
    //获取所有的key
    NSArray *array = [dic5 allKeys];
    NSLog(@"array = %@",array);
    
    //遍历
    for (id key in dic5) {
        NSLog(@"key:%@ value:%@",key,[dic5 objectForKey:key]);//通过key来获取value
    }
}
    


@end
