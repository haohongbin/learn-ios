//
//  PlayerViewVM.h
//  封装播放器
//
//  Created by hhb on 2020/11/18.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlayerViewVM : NSObject

@property(nonatomic,assign)VideoPlayState videoPlayState;

@property(nonatomic,assign)NSInteger startTime;

@property(nonatomic,assign)NSInteger totalTime;

@property(nonatomic,assign)float progress;

@property(nonatomic,assign)DeviceDirection deviceDirection;

-(NSString *)getHHMMSSFromSS:(NSInteger)seconds;

@end

NS_ASSUME_NONNULL_END
