//
//  ViewController.m
//  Banner轮播
//
//  Created by hhb on 2020/11/20.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"
#import <SDCycleScrollView.h>
#import <Masonry.h>

@interface ViewController ()<SDCycleScrollViewDelegate>

@property(nonatomic,strong)SDCycleScrollView *cycleScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray *images = [[NSMutableArray alloc]init];
    UIImage *image1 = [UIImage imageNamed:@"banner01"];
    UIImage *image2 = [UIImage imageNamed:@"banner02"];
    UIImage *image3 = [UIImage imageNamed:@"banner03"];
    [images addObject:image1];
    [images addObject:image2];
    [images addObject:image3];
    
    self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:[UIImage imageNamed:@"banner01"]];
    NSMutableArray *imageURLS = [[NSMutableArray alloc]init];
    [imageURLS addObject:@"http://image1.png"];
    [imageURLS addObject:@"http://image1.png"];
    [imageURLS addObject:@"http://image1.png"];
    [imageURLS addObject:@"http://image1.png"];
    
    self.cycleScrollView.imageURLStringsGroup = imageURLS;
    
    [self.view addSubview:self.cycleScrollView];
    [self.cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.equalTo(self.cycleScrollView.mas_width).multipliedBy(0.625);
    }];
    
}


@end
