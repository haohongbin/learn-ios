//
//  ViewController.m
//  封装播放器
//
//  Created by hhb on 2020/11/18.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "PlayerView.h"
#import "AppDelegate.h"
#import "UIDevice+SwitchDirection.h"

@interface ViewController ()

@property(nonatomic,strong)PlayerView *playerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.viewControllerVM = [[ViewControllerVM alloc]init];
    [self.viewControllerVM addObserver:self forKeyPath:@"deviceDirection" options:NSKeyValueObservingOptionNew context:nil];
        
    self.playerView = [[PlayerView alloc]init];
    
    __weak typeof(self) weakSelf = self;
    self.playerView.swichDirectionBlock = ^() {
        if (weakSelf.viewControllerVM.deviceDirection == DeviceDirectionPortrait) {
            weakSelf.viewControllerVM.deviceDirection = DeviceDirectionLandscape;
        }else{
            weakSelf.viewControllerVM.deviceDirection = DeviceDirectionPortrait;
        }
    };
    
    [self.view addSubview:self.playerView];

    [self.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    id value = change[NSKeyValueChangeNewKey];
    
    if ([keyPath isEqualToString:@"deviceDirection"]) {
        DeviceDirection deviceDirection = ((NSNumber *)value).integerValue;
        self.playerView.playerViewVM.deviceDirection = deviceDirection;
        switch (deviceDirection) {
            case DeviceDirectionPortrait:{
                
                ((AppDelegate *)[UIApplication sharedApplication].delegate).allowRotation = NO;
                
                [UIDevice switchNewOrientation:UIInterfaceOrientationPortrait];
                
                [self.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.right.top.bottom.equalTo(self.view);
                }];
                
            }
                break;
                
            case DeviceDirectionLandscape:{
                
                ((AppDelegate *)[UIApplication sharedApplication].delegate).allowRotation = YES;
                
                [UIDevice switchNewOrientation:UIInterfaceOrientationLandscapeLeft];
                
                [self.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.right.top.bottom.equalTo(self.view);
                }];
            }
                break;
                
            default:
                break;
        }
        
    }
}

- (void)dealloc{
    [self.viewControllerVM removeObserver:self forKeyPath:@"deviceDirection"];
}

@end
