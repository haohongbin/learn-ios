//
//  ViewControllerVM.m
//  封装播放器
//
//  Created by hhb on 2020/11/18.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewControllerVM.h"

@interface ViewControllerVM ()

@end

@implementation ViewControllerVM

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.deviceDirection = DeviceDirectionPortrait;
    }
    return self;
}

@end
