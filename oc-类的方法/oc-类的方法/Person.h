//
//  Person.h
//  oc-类的方法
//
//  Created by hhb on 2020/10/26.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property(nonatomic,strong)NSString *name;

@property(nonatomic,assign)NSInteger age;

- (void)functionName;

- (void)functionNameWithAge:(NSInteger)age;

- (NSInteger)function3;
@end

NS_ASSUME_NONNULL_END
