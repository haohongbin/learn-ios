//
//  Person01.m
//  oc-类的继承
//
//  Created by hhb on 2020/10/26.
//  Copyright © 2020 edz. All rights reserved.
//

#import "Person01.h"

@implementation Person01

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"xiaoming";
    }
    return self;
}
@end
