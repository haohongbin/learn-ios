//
//  ViewController.m
//  第六章
//
//  Created by hhb on 2020/11/14.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "TestCell.h"
#import "TestCellWihtXIB.h"
#import <AFNetworking.h>
#import "TestModel.h"
#import <MJRefresh.h>//下拉刷新
#import "DataManger.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,assign)NSInteger pageIndex;

@property(nonatomic,strong)NSMutableArray *dataArray;

@property(nonatomic,strong)UILabel *titleLabel;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.text = NSLocalizedString(@"title", nil);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:18];
    self.titleLabel.textColor = [UIColor blackColor];
    [self.view addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
    
    self.pageIndex = 1;
    self.dataArray = [[NSMutableArray alloc]init];
    
    //使用cocoapods 第一步要创建podfile文件,然后pod install
    
    //cell的定制 开发UI的核心
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    //我们一般不会用frame去固定位置
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        //这里写约束
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.top.equalTo(self.view);
    }];
    
    //注册
    [self.tableView registerClass:[TestCell class] forCellReuseIdentifier:@"TestCell"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TestCellWihtXIB" bundle:nil] forCellReuseIdentifier:@"TestCellWihtXIB"];
    
    __weak typeof(self) weakSelf = self;
    //下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.pageIndex = 1;
        [weakSelf requestData];
    }];
    //上滑加载
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        weakSelf.pageIndex++;
        [weakSelf requestData];
    }];
    
    //主线程
    //子线程 网络请求有延迟，一般放在子线程，异步加载
    /*使用第三方请求流程：首先会开一个线程，去进行网路请求，等数据返回之后，再回到主线程，把数据给主线程，主线程再将这些数据进行解析，解析
    成我们想要的数据模型，再赋给当前的uI，然后刷新UI展示
     */
    /*
    车 -> 口 过收费口 (8辆车排队)
    
    //现在我们开了8个子线程,就有了8个收费口
    //把每一辆车分配到一个收费口
    
    */
    
    //获取网络数据
    //AFNetworking 第三方库
    //[self requestData];
    
    //一进来做下拉刷新，下拉刷新会走上面的requestData，请求成功之后才会将header结束掉
    [self.tableView.mj_header beginRefreshing];
    
    
    //每一个app都有自己的文件目录
    //所有的app的目录都不可以相互访问
    //ios8之前可以看到沙盒根目录,模拟器也可以看到
    //沙盒根目录 下有Documents、Library、SystemData、tmp，持久化数据主要放在Documents目录中
    /*
     Library中存放缓存以及配置文件
     */
    NSString *homePath = NSHomeDirectory();
    NSLog(@"homePath = %@",homePath);
    
    /*
     持久化
     NSUserDefaults 用来存储小的数据，比如：账号和密码
     plist文件
     数据比较多的话，就使用本地数据库（sqlite） 使用第三方(FMDB)来操作
     coreData 一般不用
     */
    
    //Documents目录
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSLog(@"documentPath = %@",documentPath);
    
    NSString *account = @"user01";
    NSString *password = @"123456";
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setValue:account forKey:@"user_account"];
    [userDefault setValue:password forKey:@"user_password"];
    [userDefault synchronize];//这里建议同步存储到磁盘中，但是不是必须的 
    NSString *user_account = [userDefault objectForKey:@"user_account"];
    NSString *user_password = [userDefault objectForKey:@"user_password"];
    NSLog(@"user_account = %@",user_account);
    NSLog(@"user_password = %@",user_password);
    
//    [self savePlistData];
//    [self getPlistData];
    
//    [[DataManger sharedInstance] insertDataWithName:@"xiaowang" age:20 height:175];
    [[DataManger sharedInstance]queryDataWithName:@"xiaowang"];
}

- (void)savePlistData{
    NSDictionary *userInfo = @{
      @"name":@"xiaowang",
      @"age":@"18",
      @"height":@"180"
    };
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"userInfo.plist"];
    [userInfo writeToFile:filePath atomically:YES];
}

- (void)getPlistData{
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"userInfo.plist"];
    NSDictionary *tempData = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSLog(@"tempData = %@",tempData);
}

- (void)requestData{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.securityPolicy.allowInvalidCertificates = YES;//允许无效证书
    session.operationQueue.maxConcurrentOperationCount = 5;
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain", @"text/html",@"image/jpeg", nil];
    [session.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    session.requestSerializer.timeoutInterval = 10;//超时时间
    
    //GTE和POST
    NSString *url = @"http://frigate.100wlc.com/api/v1/taskmasters";
    //json
    NSDictionary *parameters = @{
        @"page_no":@(self.pageIndex),
        @"page_size":@"10"
    };
    __weak typeof(self) weakSelf = self;//弱引用
    [session GET:url parameters:parameters headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject = %@",responseObject);//返回的是json，responseObject已经帮我们解析成字典了
        
        [weakSelf.tableView.mj_header endRefreshing];//结束下拉刷新
        [weakSelf.tableView.mj_footer endRefreshing];//结束上拉加载
        
        //下拉刷新需要将数据删除再重新添加，否则会有重复数据
        if (weakSelf.pageIndex == 1) {
            [weakSelf.dataArray removeAllObjects];
        }
        
        
        id data = responseObject[@"taskmasters"];
        if ([data isKindOfClass:[NSArray class]]) {
            for (NSDictionary *dic in data) {
                TestModel *model = [[TestModel alloc]init];
                [model setValueWithData:dic];
                [weakSelf.dataArray addObject:model];
            }
            [weakSelf.tableView reloadData];//重新加载数据
        }else {
            NSLog(@"不是数组");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        /*报错App Transport Security...时
        在Info.plist中增加App Transport Security Settings，下面增加Allow Arbitrary Loads设置为YES*/
        NSLog(@"失败了");
        [weakSelf.tableView.mj_header endRefreshing];
        [weakSelf.tableView.mj_footer endRefreshing];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row > 4) {
        TestCellWihtXIB *cell = [tableView dequeueReusableCellWithIdentifier:@"TestCellWihtXIB" forIndexPath:indexPath];
        
        TestModel *model = self.dataArray[indexPath.row];
        cell.testTitleLabel.text = model.taskmsters_id;
        cell.subTestTitleLabel.text = model.device_type;
        
        return cell;
    }
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestCell" forIndexPath:indexPath];
    TestModel *model = self.dataArray[indexPath.row];
    cell.testTitleLabel.text = model.taskmsters_id;
    cell.subTestTitleLabel.text = model.device_type;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
@end
