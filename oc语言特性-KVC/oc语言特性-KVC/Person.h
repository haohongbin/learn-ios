//
//  Person.h
//  oc语言特性-KVC
//
//  Created by hhb on 2020/10/28.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Address.h"
NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property(nonatomic,strong)NSString *name;

@property(nonatomic,assign)NSInteger age;

@property(nonatomic,strong)Address *address;
@end

NS_ASSUME_NONNULL_END
