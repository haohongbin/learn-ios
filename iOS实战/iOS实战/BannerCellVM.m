//
//  BannerCellVM.m
//  iOS实战
//
//  Created by hhb on 2020/11/24.
//  Copyright © 2020 edz. All rights reserved.
//

#import "BannerCellVM.h"

@implementation BannerCellVM

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.imagesArray = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)setDataWithBannerList:(NSMutableArray <BannerModel *>*)bannerList{
    NSMutableArray *tempArray = [[NSMutableArray alloc]init];
    for (BannerModel *model in bannerList) {
        [tempArray addObject:model.iosImgPath];
    }
    self.imagesArray = tempArray;
}
@end
