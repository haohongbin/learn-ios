//
//  CommonHeader.h
//  封装播放器
//
//  Created by hhb on 2020/11/18.
//  Copyright © 2020 edz. All rights reserved.
//

#ifndef CommonHeader_h
#define CommonHeader_h

typedef NS_ENUM(NSInteger,VideoPlayState)
{
    VideoPlayStateUnknowError,//未知
    VideoPlayStateFailed,//播放失败
    VideoPlayStatePlaying,//播放中
    VideoPlayStatePause,//暂停
    VideoPlayStateLoading,//加载中
    VideoPlayStateFinish,//播放完成
};

typedef NS_ENUM(NSInteger,DeviceDirection)
{
    DeviceDirectionPortrait,//竖屏
    DeviceDirectionLandscape//横屏
};

#endif /* CommonHeader_h */
