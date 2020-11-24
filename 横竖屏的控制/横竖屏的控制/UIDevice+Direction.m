//
//  UIDevice+Direction.m
//  横竖屏的控制
//
//  Created by hhb on 2020/11/14.
//  Copyright © 2020 edz. All rights reserved.
//

#import "UIDevice+Direction.h"

@implementation UIDevice (Direction)

+ (void)setNewOrientation:(UIInterfaceOrientation)orientation{
    //强制修改设备方向
    NSNumber *resetOrientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
    
    [[UIDevice currentDevice] setValue:resetOrientationTarget forKey:@"orientation"];
    
    NSNumber *orientationTarget = [NSNumber numberWithInt:orientation];
    
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
}

@end
