//
//  ViewController.m
//  UITableView
//
//  Created by hhb on 2020/11/9.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"
#import "TestCell.h"
#import "Test2Cell.h"
#import "CustomCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //UITableViewStyleGrouped分组 UITableViewStylePlain列表
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    //注册
    [self.tableView registerClass:[TestCell class] forCellReuseIdentifier:@"TestCell"];
    [self.tableView registerClass:[Test2Cell class] forCellReuseIdentifier:@"Test2Cell"];
    //注册xib
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"CustomCell"];
}

//分组，有两组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

//配置每个section(段）有多少row（行） cell
//默认只有一个section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 10;
    }
    return 5;
}
//每行显示什么东西
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        TestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestCell" forIndexPath:indexPath];

        cell.textLabel.text = [NSString stringWithFormat:@"第%ld组 第%ld行",indexPath.section,indexPath.row + 1];

        return cell;
    }

//    Test2Cell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"Test2Cell" forIndexPath:indexPath];
//
//    cell2.textLabel.text = [NSString stringWithFormat:@"第%ld组 第%ld行",indexPath.section,indexPath.row + 1];
    
    CustomCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"CustomCell" forIndexPath:indexPath];

    return cell2;
}

//不同分组不同高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 50;
    }
    return 58;
}
//返回header的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGFLOAT_MIN;//最小最小值
    }
    return 44;
}
//定义header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return nil;
    }
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor redColor];
    return view;
}

//点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"我触发了 组 = %ld 行 = %ld",(long)indexPath.section,(long)indexPath.row);
}
@end
