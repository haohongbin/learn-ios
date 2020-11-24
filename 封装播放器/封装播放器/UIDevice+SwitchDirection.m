//
//  UIDevice+SwitchDirection.m
//  封装播放器
//
//  Created by hhb on 2020/11/18.
//  Copyright © 2020 edz. All rights reserved.
//

#import "UIDevice+SwitchDirection.h"

@implementation UIDevice (SwitchDirection)

+ (void)switchNewOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    NSNumber *resetOrientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
    
    [[UIDevice currentDevice] setValue:resetOrientationTarget forKey:@"orientation"];
    
    NSNumber *orientationTarget = [NSNumber numberWithInt:interfaceOrientation];
    
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
}

@end
