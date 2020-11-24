//
//  UIDevice+Direction.h
//  横竖屏的控制
//
//  Created by hhb on 2020/11/14.
//  Copyright © 2020 edz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//创建类别
@interface UIDevice (Direction)

+ (void)setNewOrientation:(UIInterfaceOrientation)orientation;

@end

NS_ASSUME_NONNULL_END
