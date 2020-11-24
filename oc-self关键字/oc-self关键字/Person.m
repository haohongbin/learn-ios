//
//  Person.m
//  oc-self关键字
//
//  Created by hhb on 2020/10/26.
//  Copyright © 2020 edz. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)function01{
    NSLog(@"function01触发");
    self.name = @"xxx";
}

- (void)function03{
    //self代表的是调用者
    [self function01];
}

+ (void)function04{
    NSLog(@"function04触发");
}

+ (void)function02{
    NSLog(@"function02触发");
    [Person function04];
    
    [self function04];
    //self代表的是当前方法的调用者
}
@end
