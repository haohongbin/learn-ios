//
//  BannerCellVM.h
//  iOS实战
//
//  Created by hhb on 2020/11/24.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BannerModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BannerCellVM : NSObject

@property(nonatomic,strong)NSMutableArray <NSString *>*imagesArray;

- (void)setDataWithBannerList:(NSMutableArray <BannerModel *>*)bannerList;
@end

NS_ASSUME_NONNULL_END
