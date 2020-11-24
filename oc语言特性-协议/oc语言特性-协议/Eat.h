//
//  Eat.h
//  oc语言特性-协议
//
//  Created by hhb on 2020/10/27.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//协议
@protocol Eat <NSObject>

@required//这个修改的方法是必须实现的
- (void)eat;

@optional//这个修饰的方法是可选实现的
- (void)watch;

@end

NS_ASSUME_NONNULL_END
