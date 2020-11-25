//
//  NSObject+CommonTool.m
//  iOS实战
//
//  Created by hhb on 2020/11/25.
//  Copyright © 2020 edz. All rights reserved.
//

#import "NSObject+CommonTool.h"

@implementation NSObject (CommonTool)

- (NSString *)filterData:(id)data{
    if (data && ![data isKindOfClass:[NSNull class]]) {
        if ([data isKindOfClass:[NSString class]]) {
            return data;
        }else if ([data isKindOfClass:[NSNumber class]]){
            return ((NSNumber *)data).stringValue;
        }
    }
    return @"";
}
@end
