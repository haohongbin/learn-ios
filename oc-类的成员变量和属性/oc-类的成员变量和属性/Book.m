//
//  Book.m
//  oc-类的成员变量和属性
//
//  Created by hhb on 2020/10/26.
//  Copyright © 2020 edz. All rights reserved.
//

#import "Book.h"

@interface Book()
{
    NSString *author;//成员变量,不能通过.访问
}

@end

@implementation Book
//重写init方法
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"xxx";
        self.price = 100;//成员属性会给我们自动创建set和get方法
        self->author = @"xx";
        
    }
    return self;
}
- (void)setName:(NSString *)name{
    
}

- (NSString *)name{
    return @"xxxxx";
}

@end
