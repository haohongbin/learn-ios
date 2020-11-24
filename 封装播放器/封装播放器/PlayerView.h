//
//  PlayerView.h
//  封装播放器
//
//  Created by hhb on 2020/11/18.
//  Copyright © 2020 edz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerViewVM.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlayerView : UIView

@property(nonatomic,strong)PlayerViewVM *playerViewVM;

@property(nonatomic,strong)void(^swichDirectionBlock)(void);

@end

NS_ASSUME_NONNULL_END
