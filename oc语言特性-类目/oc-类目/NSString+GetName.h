//
//  NSString+GetName.h
//  oc-类目
//
//  Created by hhb on 2020/10/27.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (GetName)
//@property(nonatomic,strong)NSString *test;//不可以给类别/类目添加属性

- (NSString *)getName;

- (NSInteger)getAge;
@end

NS_ASSUME_NONNULL_END
