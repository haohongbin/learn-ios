//
//  Person.h
//  oc语言特性-单例
//
//  Created by hhb on 2020/10/28.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

+ (Person *)shareInstance;

@end

NS_ASSUME_NONNULL_END
