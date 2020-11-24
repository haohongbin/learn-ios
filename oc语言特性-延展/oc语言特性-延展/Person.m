//
//  Person.m
//  oc语言特性-延展
//
//  Created by hhb on 2020/10/27.
//  Copyright © 2020 edz. All rights reserved.
//

#import "Person.h"

@interface Person ()
//延展的属性，私有
@property(nonatomic,assign)NSInteger age;
- (void)test;

@end

@implementation Person

- (void)test{
    NSLog(@"触发test");
}
- (void)test1{
    [self test];
    self.age = 11;
    NSLog(@"age = %ld",(long)self.age);
}
@end
