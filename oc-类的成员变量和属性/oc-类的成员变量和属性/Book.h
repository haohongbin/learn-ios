//
//  Book.h
//  oc-类的成员变量和属性
//
//  Created by hhb on 2020/10/26.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Book : NSObject
//strong是强引用
//assign 弱引用，一般用来修饰基本数据类型，float int CGFloat NSInteger BOOL 枚举等等
//成员属性
@property(nonatomic,strong)NSString *name;

@property(nonatomic,assign)float price;
@end

NS_ASSUME_NONNULL_END
