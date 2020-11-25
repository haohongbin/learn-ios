//
//  NSObject+CommonTool.h
//  iOS实战
//
//  Created by hhb on 2020/11/25.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CommonTool)

- (NSString *)filterData:(id)data;
- (NSString *)getDateStrWithTimeStamp:(NSTimeInterval)timeStamp formatter:(NSDateFormatter *)formatter;

@end

NS_ASSUME_NONNULL_END
