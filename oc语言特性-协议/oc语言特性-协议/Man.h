//
//  Man.h
//  oc语言特性-协议
//
//  Created by hhb on 2020/10/27.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Eat.h"
NS_ASSUME_NONNULL_BEGIN

@interface Man : NSObject<Eat>

@property(nonatomic,weak)id<Eat> delegate;

@end

NS_ASSUME_NONNULL_END
