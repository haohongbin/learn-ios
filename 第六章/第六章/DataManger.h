//
//  DataManger.h
//  第六章
//
//  Created by hhb on 2020/11/17.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataManger : NSObject

+ (DataManger *)sharedInstance;

- (void)insertDataWithName:(NSString *)name age:(NSInteger)age height:(NSInteger)height;

- (NSInteger)queryDataWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
