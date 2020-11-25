//
//  ViewController.m
//  iOS实战
//
//  Created by hhb on 2020/11/24.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"
#import "BannerCell.h"
#import "FunctionCell.h"
#import "HotCourseCell.h"
#import "ActivityCell.h"
#import "NewsCell.h"
#import <Masonry.h>
#import "HeaderView.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Home";
    
    [self creatUI];
}

- (void)creatUI{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;

    self.tableView.estimatedRowHeight = 100.0f;//模糊高度，对于cell无法确定的高度 比如：文字
    self.tableView.estimatedSectionFooterHeight = CGFLOAT_MIN;
    self.tableView.estimatedSectionHeaderHeight = CGFLOAT_MIN;
    
    [self.tableView registerClass:[BannerCell class] forCellReuseIdentifier:@"BannerCell"];
    [self.tableView registerClass:[FunctionCell class] forCellReuseIdentifier:@"FunctionCell"];
    [self.tableView registerClass:[HotCourseCell class] forCellReuseIdentifier:@"HotCourseCell"];
    [self.tableView registerClass:[ActivityCell class] forCellReuseIdentifier:@"ActivityCell"];
    [self.tableView registerClass:[NewsCell class] forCellReuseIdentifier:@"NewsCell"];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

#pragma mark-UITableViewDelegate,UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else{
        return 3;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            //banner
            BannerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BannerCell" forIndexPath:indexPath];
            cell.selectedBanner = ^(NSInteger index) {
                NSLog(@"index = %ld",(long)index);
            };
            return cell;
        }else{
            //功能
            FunctionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionCell" forIndexPath:indexPath];
            
            return cell;
        }
    }else if (indexPath.section == 1){
        //推荐课
        HotCourseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HotCourseCell" forIndexPath:indexPath];
        
        return cell;
    }else if (indexPath.section == 2){
        //近期活动
        ActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActivityCell" forIndexPath:indexPath];
        return cell;
    }else{
        NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell" forIndexPath:indexPath];
        return cell;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return nil;
    }
    HeaderView *view = [[HeaderView alloc]init];
    return view;
}
@end
