//
//  ViewController.m
//  视频播放
//
//  Created by hhb on 2020/11/18.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>
/*
 iOS 9.0由于强制使用https ， 所以之前使用的 http的连接 的应用如果不做特殊配制就都不可以运行了，为了解决这个问题要在工程的info.plit中添加如下配制
 App Transport Security Settings 下添加Allow Arbitrary Loads YES
 */
@interface ViewController ()
//定义一个播放器
@property(nonatomic,strong)AVPlayerViewController *playerVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
    Apple为我们提供了多种方法来实现视频播放，包括
    MPMoviePlayerController，
    MPMoviePlayerViewController，
    AVPlayer，
    AVPlayerViewController等。而值得注意的是，上述的MPMoviePlayerController与MPMoviePlayerViewController在iOS9.0之后被弃用
    */
    NSString *videoUrl = @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
    //初始化视频播放器控制器
    self.playerVC = [[AVPlayerViewController alloc]init];
//    [NSURL fileURLWithPath:videoUrl];
    //初始化播放器
    self.playerVC.player = [AVPlayer playerWithURL:[NSURL URLWithString:videoUrl]];
    self.playerVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, 300);
    self.playerVC.showsPlaybackControls = YES;
    //显示播放控制按钮
    self.playerVC.exitsFullScreenWhenPlaybackEnds = YES;
    //self.playerVC.entersFullScreenWhenPlaybackBegins = YES;//开启这个播放的时候支持（全屏）横竖屏哦
    //self.playerVC.exitsFullScreenWhenPlaybackEnds = YES;//开启这个所有 item 播放完毕可以退出全屏
    [self.view addSubview:self.playerVC.view];
    //加载好之后，播放
    if (self.playerVC.readyForDisplay) {
        [self.playerVC.player play];
    }
}


@end
