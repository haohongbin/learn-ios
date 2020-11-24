//
//  Test2Cell.m
//  UITableView
//
//  Created by hhb on 2020/11/9.
//  Copyright © 2020 edz. All rights reserved.
//

#import "Test2Cell.h"

@implementation Test2Cell

//重写父类的init方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellAccessoryNone;
        
        self.contentView.backgroundColor = [UIColor yellowColor];
        
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

@end
