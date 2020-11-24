//
//  TestModel.h
//  第六章
//
//  Created by hhb on 2020/11/16.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestModel : NSObject

@property(nonatomic,copy)NSString *created_at;
@property(nonatomic,copy)NSString *device_type;
@property(nonatomic,copy)NSString *taskmsters_id;
@property(nonatomic,copy)NSString *status;
@property(nonatomic,copy)NSString *updated_at;

- (void)setValueWithData:(NSDictionary *)data;
@end

NS_ASSUME_NONNULL_END
