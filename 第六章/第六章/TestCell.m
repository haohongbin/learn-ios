//
//  TestCell.m
//  第六章
//
//  Created by hhb on 2020/11/14.
//  Copyright © 2020 edz. All rights reserved.
//

#import "TestCell.h"
#import <Masonry.h>

@interface TestCell()

@property(nonatomic,strong)UIImageView *testImageView;



@end

@implementation TestCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.testImageView = [[UIImageView alloc]init];
        self.testImageView.image = [UIImage imageNamed:@"test_image"];
        [self.contentView addSubview:self.testImageView];
        [self.testImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(20);
            make.top.equalTo(self.contentView).offset(20);
            make.bottom.equalTo(self.contentView).offset(-20);
            make.size.mas_equalTo(CGSizeMake(80, 80));
        }];
        
        self.testTitleLabel = [[UILabel alloc]init];
        self.testTitleLabel.text = @"我是title";
        self.testTitleLabel.textColor = [UIColor blackColor];
        self.testTitleLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:self.testTitleLabel];
        [self.testTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.testImageView.mas_right).offset(8);
            make.top.equalTo(self.testImageView);
            make.right.equalTo(self.contentView).offset(-20);
        }];
        
        self.subTestTitleLabel = [[UILabel alloc]init];
        self.subTestTitleLabel.text = @"我是SubTitle";
        self.subTestTitleLabel.textColor = [UIColor lightGrayColor];
        self.subTestTitleLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.subTestTitleLabel];
        [self.subTestTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.testImageView.mas_right).offset(8);
            make.right.equalTo(self.contentView).offset(-20);
            make.bottom.equalTo(self.testImageView);
        }];
    }
    return self;
}

@end
