//
//  BannerCell.h
//  iOS实战
//
//  Created by hhb on 2020/11/24.
//  Copyright © 2020 edz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BannerCell : UITableViewCell

//定义一个block，把index带出来
@property(nonatomic,strong)void(^selectedBanner)(NSInteger index);

@end

NS_ASSUME_NONNULL_END
