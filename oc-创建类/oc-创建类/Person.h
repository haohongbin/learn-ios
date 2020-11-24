//
//  Person.h
//  oc-创建类
//
//  Created by hhb on 2020/10/26.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property(nonatomic,strong)NSString *name;
@property(nonatomic,assign)NSInteger sex;
@property(nonatomic,assign)NSInteger age;
@end

NS_ASSUME_NONNULL_END
