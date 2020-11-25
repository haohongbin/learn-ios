//
//  BannerModel.h
//  iOS实战
//
//  Created by hhb on 2020/11/24.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BannerModel : NSObject

@property(nonatomic,copy)NSString *iosImgPath;

- (void)setValueWithData:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END
