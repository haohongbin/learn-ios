//
//  Son.m
//  oc-super关键字
//
//  Created by hhb on 2020/10/26.
//  Copyright © 2020 edz. All rights reserved.
//

#import "Son.h"

@implementation Son

//- (void)test{
//    [self class];//class 获取方法调用者的类
//    [self superclass];//superclass获取方法调用者的父类
   //super是编译器指示符，仅仅是一个标志，并不是一个指针，是标志的当前对象去调用父类的方法，本质上还是当前对象调用，并不是让父类对象调用方法，调用者还是本身。
//    [super class];
//    [super superclass];//superclass获取方法调用者的父类
//    NSLog(@"\n%@\n%@\n%@\n%@",[self class],[self superclass],[super class],[super superclass]);
//}

- (void)test{
    NSLog(@"son的test");
    [super test];//son调用父类的test方法
}
@end
