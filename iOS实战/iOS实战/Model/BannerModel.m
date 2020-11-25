//
//  BannerModel.m
//  iOS实战
//
//  Created by hhb on 2020/11/24.
//  Copyright © 2020 edz. All rights reserved.
//

#import "BannerModel.h"
#import "NSObject+CommonTool.h"

@implementation BannerModel

- (void)setValueWithData:(NSDictionary *)data{
    self.iosImgPath = [self filterData:data[@"iosImgPath"]];
}

@end
