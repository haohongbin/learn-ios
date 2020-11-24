//
//  Person.h
//  oc-self关键字
//
//  Created by hhb on 2020/10/26.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property(nonatomic,strong)NSString *name;

//实例方法
- (void)function01;

- (void)function03;

//类方法。+方法
+ (void)function02;

@end

NS_ASSUME_NONNULL_END
