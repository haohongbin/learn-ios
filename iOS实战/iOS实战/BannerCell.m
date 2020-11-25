//
//  BannerCell.m
//  iOS实战
//
//  Created by hhb on 2020/11/24.
//  Copyright © 2020 edz. All rights reserved.
//

#import "BannerCell.h"
#import <SDCycleScrollView.h>
#import <Masonry.h>

@interface BannerCell()<SDCycleScrollViewDelegate>

@property(strong,nonatomic)SDCycleScrollView *cycleScrollView;

@end

@implementation BannerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:[UIImage imageNamed:@"default_banner"]];
        self.cycleScrollView.layer.cornerRadius = 4.0f;//圆角
        self.cycleScrollView.clipsToBounds = YES;//内容和子视图将剪裁到视图的边界
        self.cycleScrollView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.cycleScrollView];
        [self.cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.contentView).offset(20);
            make.right.bottom.equalTo(self.contentView).offset(-20);
            make.height.equalTo(self.cycleScrollView.mas_width).multipliedBy(0.416);//高宽比
        }];
        self.cycleScrollView.currentPageDotColor = [UIImage imageNamed:@"pointwhite"];//当前滚动图标大小
        self.cycleScrollView.pageDotImage = [UIImage imageNamed:@"point"];
        self.cycleScrollView.pageControlDotSize = CGSizeMake(6, 6);
    }
    return self;
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    //用一个block将点击事件带出来
    if (self.selectedBanner) {
        self.selectedBanner(index);
    }
}

@end
