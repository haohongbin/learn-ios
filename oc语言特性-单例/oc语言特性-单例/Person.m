//
//  Person.m
//  oc语言特性-单例
//
//  Created by hhb on 2020/10/28.
//  Copyright © 2020 edz. All rights reserved.
//

#import "Person.h"

@implementation Person

static Person *_person;
//
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        if (_person == nil) {
            _person = [super allocWithZone:zone];
        }
    });
    return _person;
}

+ (Person *)shareInstance{
    return [[self alloc]init];
}

- (id)copyWithZone:(NSZone *)zone{
    return _person;
}

- (id)mutableCopyWithZone:(NSZone*)zone{
    return _person;
}
@end
