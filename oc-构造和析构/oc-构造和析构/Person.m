//
//  Person.m
//  oc-构造和析构
//
//  Created by hhb on 2020/10/26.
//  Copyright © 2020 edz. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        //init 就是构造函数
        self.name = @"xiaoming";
        NSLog(@"我是构造函数");
    }
    return self;
}

- (void)dealloc{
    //创建的实例被释放之后，系统自动回调
    NSLog(@"我被释放了");
}
@end
