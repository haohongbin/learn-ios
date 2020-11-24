//
//  TestModel.m
//  第六章
//
//  Created by hhb on 2020/11/16.
//  Copyright © 2020 edz. All rights reserved.
//

#import "TestModel.h"

@implementation TestModel

- (NSString *)filterData:(id)data{
    if (data && ![data isKindOfClass:[NSNull class]]) {
        if ([data isKindOfClass:[NSString class]]) {
            return data;
        }else if([data isKindOfClass:[NSNumber class]]) {
            return ((NSNumber *)data).stringValue;
        }
    }
    return @"";
}

- (void)setValueWithData:(NSDictionary *)data{
    self.created_at = [self filterData:data[@"created_at"]];
    self.device_type = [self filterData:data[@"device_type"]];
    self.taskmsters_id = [self filterData:data[@"id"]];
    self.status = [self filterData:data[@"status"]];
    self.updated_at = [self filterData:data[@"updated_at"]];
}
@end
