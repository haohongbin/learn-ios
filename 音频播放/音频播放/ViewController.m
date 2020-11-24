//
//  ViewController.m
//  音频播放
//
//  Created by hhb on 2020/11/18.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <Masonry.h>

@interface ViewController ()<AVAudioPlayerDelegate>

@property(nonatomic,strong)AVAudioPlayer *audioPlayer;

@property(nonatomic,strong)NSTimer *time;

@property(nonatomic,strong)UIButton *playButton;

@property(nonatomic,strong)UILabel *currentTimeLabel;

@property(nonatomic,strong)UILabel *totalTimeLabel;

@property(nonatomic,strong)UISlider *slider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 0. 设置后台音频会话
    [self setBackGroundPlay];
    // 1. 获取资源URL
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"testMusic.mp3" withExtension:nil];
    //2. 根据资源URL, 创建 AVAudioPlayer 对象
    self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    // 2.1 设置允许倍速播放
//    self.audioPlayer.enableRate = YES;
    // 3. 准备播放
    [self.audioPlayer prepareToPlay];
    // 4. 设置代理, 监听播放事件
    self.audioPlayer.delegate = self;
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.center.equalTo(self.view);
        make.height.mas_equalTo(50);
    }];
    
    self.playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.playButton addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
    [self.playButton setTitle:@"播放" forState:UIControlStateNormal];
    self.playButton.backgroundColor = [UIColor redColor];
    [self.playButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [view addSubview:self.playButton];
    [self.playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.left.equalTo(view).offset(8);
        make.bottom.equalTo(view);
    }];
    
    self.currentTimeLabel = [[UILabel alloc]init];
    self.currentTimeLabel.text = @"00:00:00";
    self.currentTimeLabel.textColor = [UIColor whiteColor];
    self.currentTimeLabel.font = [UIFont systemFontOfSize:13];
    self.currentTimeLabel.textAlignment = NSTextAlignmentCenter;
    [view addSubview:self.currentTimeLabel];
    [self.currentTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 20));
        make.centerY.equalTo(self.playButton);
        make.left.equalTo(self.playButton.mas_right);
    }];
    
    self.totalTimeLabel = [[UILabel alloc]init];
    self.totalTimeLabel.text = @"00:00:00";
    self.totalTimeLabel.textColor = [UIColor whiteColor];
    self.totalTimeLabel.font = [UIFont systemFontOfSize:13];
    self.totalTimeLabel.textAlignment = NSTextAlignmentCenter;
    [view addSubview:self.totalTimeLabel];
    [self.totalTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 20));
        make.centerY.equalTo(self.playButton);
        make.right.equalTo(view).offset(-8);
    }];
    
    self.slider = [[UISlider alloc]init];
    [view addSubview:self.slider];
    [self.slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.currentTimeLabel.mas_right);
        make.right.equalTo(self.totalTimeLabel.mas_left);
        make.centerY.equalTo(self.playButton);
    }];
    
    self.time = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    [self.time setFireDate:[NSDate distantFuture]];
}

- (void)setBackGroundPlay{
    // 1. 设置会话模式
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    // 2. 激活会话
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
}

- (void)play:(UIButton *)sender{
    if ([self.audioPlayer isPlaying]) {
        [self.audioPlayer pause];
        [self.time setFireDate:[NSDate distantFuture]];
        [self.playButton setTitle:@"播放" forState:UIControlStateNormal];
    }else{
        [self.audioPlayer play];
        [self.time setFireDate:[NSDate distantPast]];
        [self.playButton setTitle:@"暂停" forState:UIControlStateNormal];
    }
}

//停止
- (void)stop{
    //停止某个音乐, 并不会重置播放时间, 下次再播放, 会从当前位置开始播放
    [self.audioPlayer stop];
    // 重置当前播放时间
    self.audioPlayer.currentTime = 0;
}

- (void)timerAction:(NSTimer *)sender{
    self.slider.value = self.audioPlayer.currentTime/self.audioPlayer.duration;
    self.currentTimeLabel.text = [self getHHMMSSFromSS:self.audioPlayer.currentTime];
    self.totalTimeLabel.text = [self getHHMMSSFromSS:self.audioPlayer.duration];
}

//传入 秒  得到 xx:xx:xx
-(NSString *)getHHMMSSFromSS:(NSInteger)seconds{
    
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    
    return format_time;
    
}
#pragma mark - 播放器代理
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    NSLog(@"播放完成");
    [self.time setFireDate:[NSDate distantFuture]];//暂停定时器
    [self.playButton setTitle:@"播放" forState:UIControlStateNormal];
    self.slider.value = 0;
    self.currentTimeLabel.text = @"00:00:00";
}
@end
