//
//  Person.m
//  oc-类的方法
//
//  Created by hhb on 2020/10/26.
//  Copyright © 2020 edz. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)functionName{
    NSLog(@"我被调用了");
}

- (void)functionNameWithAge:(NSInteger)age{
    self.age = age;
}

- (NSInteger)function3{
    return 15;
}
@end
