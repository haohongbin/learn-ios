//
//  PlayerView.m
//  封装播放器
//
//  Created by hhb on 2020/11/18.
//  Copyright © 2020 edz. All rights reserved.
//

#import "PlayerView.h"
#import <AVFoundation/AVFoundation.h>
#import <Masonry.h>

@interface PlayerView()
//播放器
@property(strong,nonatomic)AVPlayer *player;
//播放单元
@property(strong,nonatomic)AVPlayerItem *playerItem;
//播放界面(layer)
@property(strong,nonatomic)AVPlayerLayer *playerLayer;
//播放监听
@property(strong,nonatomic)id playTimeObserver;
//控制播放或者暂停的按钮
@property(strong,nonatomic)UIButton *playButton;
//当前播放时间
@property(strong,nonatomic)UILabel *startTimeLabel;
//视频总时间
@property(strong,nonatomic)UILabel *totalTimeLabel;
//进度条
@property(strong,nonatomic)UIProgressView *progressView;
//方向
@property(strong,nonatomic)UIButton *screenDirectionButton;

@end

@implementation PlayerView

+ (Class)layerClass {
    return [AVPlayerLayer class];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.playerViewVM = [[PlayerViewVM alloc]init];
        
        [self.playerViewVM addObserver:self forKeyPath:@"videoPlayState" options:NSKeyValueObservingOptionNew context:nil];
        
        [self.playerViewVM addObserver:self forKeyPath:@"startTime" options:NSKeyValueObservingOptionNew context:nil];
        
        [self.playerViewVM addObserver:self forKeyPath:@"totalTime" options:NSKeyValueObservingOptionNew context:nil];
        
        [self.playerViewVM addObserver:self forKeyPath:@"progress" options:NSKeyValueObservingOptionNew context:nil];
        
        [self.playerViewVM addObserver:self forKeyPath:@"deviceDirection" options:NSKeyValueObservingOptionNew context:nil];
        
        self.backgroundColor = [UIColor blackColor];
        
        NSString *videoPath = @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
        
        NSURL *videoURL = [NSURL URLWithString:videoPath];
        
        self.playerItem = [AVPlayerItem playerItemWithURL:videoURL];
        
        //监听status属性，注意监听的是AVPlayerItem
        [self.playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
        self.player = [AVPlayer playerWithPlayerItem:self.playerItem];
        self.playerLayer = (AVPlayerLayer*)self.layer;
        [self.playerLayer setPlayer:self.player];
        
        self.playerViewVM.videoPlayState = VideoPlayStatePlaying;
        __weak typeof(self) weakSelf = self;
        self.playTimeObserver = [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
            
            //当前播放的时间
            NSTimeInterval current = CMTimeGetSeconds(time);
            weakSelf.playerViewVM.startTime = current;
            
            //视频的总时间
            NSTimeInterval total = CMTimeGetSeconds(weakSelf.player.currentItem.duration);
            weakSelf.playerViewVM.totalTime = total;
            
            weakSelf.playerViewVM.progress = current / total;
            
        }];
        
        self.playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.playButton addTarget:self action:@selector(playButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.playButton setTitle:@"暂停" forState:UIControlStateNormal];
        [self.playButton setBackgroundColor:[UIColor redColor]];
        [self.playButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self addSubview:self.playButton];
        [self.playButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 30));
            make.left.bottom.equalTo(self);
        }];
        
        self.startTimeLabel = [[UILabel alloc]init];
        self.startTimeLabel.text = @"00:00:00";
        self.startTimeLabel.font = [UIFont systemFontOfSize:13];
        self.startTimeLabel.textColor = [UIColor whiteColor];
        self.startTimeLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.startTimeLabel];
        [self.startTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.playButton.mas_right);
            make.centerY.equalTo(self.playButton);
            make.width.mas_equalTo(80);
        }];
        
        self.screenDirectionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.screenDirectionButton setTitle:@"竖屏" forState:UIControlStateNormal];
        [self.screenDirectionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.screenDirectionButton setBackgroundColor:[UIColor redColor]];
        [self.screenDirectionButton addTarget:self action:@selector(swichDirectionAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.screenDirectionButton];
        [self.screenDirectionButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self);
            make.centerY.equalTo(self.startTimeLabel);
            make.size.mas_equalTo(CGSizeMake(50, 35));
        }];
        
        self.totalTimeLabel = [[UILabel alloc]init];
        self.totalTimeLabel.text = @"00:00:00";
        self.totalTimeLabel.font = [UIFont systemFontOfSize:13];
        self.totalTimeLabel.textColor = [UIColor whiteColor];
        self.totalTimeLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.totalTimeLabel];
        [self.totalTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.screenDirectionButton.mas_left);
            make.centerY.equalTo(self.playButton);
            make.width.equalTo(self.startTimeLabel);
        }];
        
        self.progressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
        [self addSubview:self.progressView];
        [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.playButton);
            make.left.equalTo(self.startTimeLabel.mas_right);
            make.right.equalTo(self.totalTimeLabel.mas_left);
        }];
    }
    return self;
}

- (void)swichDirectionAction:(UIButton *)sender{
    
    if (self.swichDirectionBlock) {
        self.swichDirectionBlock();
    }
}

- (void)playButtonAction:(UIButton *)sender{
    
    if (self.playerViewVM.videoPlayState == VideoPlayStatePlaying) {
        self.playerViewVM.videoPlayState = VideoPlayStatePause;
    }else{
        self.playerViewVM.videoPlayState = VideoPlayStatePlaying;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    id value = change[NSKeyValueChangeNewKey];
    
    if ([keyPath isEqualToString:@"status"]) {
        
        NSNumber *status = (NSNumber *)value;
        
        if (status.integerValue == AVPlayerItemStatusReadyToPlay){
            NSLog(@"准备播放");
        } else if(status.integerValue == AVPlayerStatusUnknown){
            NSLog(@"未知错误");
        }else if (status.integerValue == AVPlayerStatusFailed){
            NSLog(@"失败");
        }
        
    }else if ([keyPath isEqualToString:@"videoPlayState"]) {
        VideoPlayState videoPlayState = ((NSNumber *)value).integerValue;
        switch (videoPlayState) {
            case VideoPlayStateUnknowError:{
                
            }
                break;
                
            case VideoPlayStateFailed:{
                
            }
                break;
                
            case VideoPlayStatePlaying:{
                [self.playButton setTitle:@"暂停" forState:UIControlStateNormal];
                [self.player play];
                
            }
                break;
                
            case VideoPlayStatePause:{
                [self.playButton setTitle:@"播放" forState:UIControlStateNormal];
                [self.player pause];

            }
                break;
                
            case VideoPlayStateFinish:{
                
            }
                break;
                
            default:
                break;
        }
        
    }else if ([keyPath isEqualToString:@"startTime"]) {
        NSInteger startTime = ((NSNumber *)value).integerValue;
        self.startTimeLabel.text = [self.playerViewVM getHHMMSSFromSS:startTime];
        
    }else if ([keyPath isEqualToString:@"totalTime"]) {
        NSInteger totalTime = ((NSNumber *)value).integerValue;
        self.totalTimeLabel.text = [self.playerViewVM getHHMMSSFromSS:totalTime];
        
    }else if ([keyPath isEqualToString:@"progress"]) {
        float progress = ((NSNumber *)value).floatValue;
        self.progressView.progress = progress;
        
    }else if ([keyPath isEqualToString:@"deviceDirection"]) {
        
        DeviceDirection deviceDirection = ((NSNumber *)value).integerValue;
        switch (deviceDirection) {
            case DeviceDirectionPortrait:{
                [self.screenDirectionButton setTitle:@"竖屏" forState:UIControlStateNormal];
            }
                break;
                
            case DeviceDirectionLandscape:{
                [self.screenDirectionButton setTitle:@"横屏" forState:UIControlStateNormal];
            }
                break;
                
            default:
                break;
        }
        
    }
}

- (void)dealloc{
    [self.playerItem removeObserver:self forKeyPath:@"status"];
    
    [self.playerViewVM removeObserver:self forKeyPath:@"videoPlayState"];
    [self.playerViewVM removeObserver:self forKeyPath:@"startTime"];
    [self.playerViewVM removeObserver:self forKeyPath:@"totalTime"];
    [self.playerViewVM removeObserver:self forKeyPath:@"progress"];
    [self.playerViewVM removeObserver:self forKeyPath:@"deviceDirection"];

    


}

@end
