//
//  ViewController.m
//  UICollectionView
//
//  Created by hhb on 2020/11/10.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"
#import "TestCell.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
//UICollectionView 九宫格
@property(nonatomic,strong)UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建一个layout布局类
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //设置布局方向为垂直流布局 UICollectionViewScrollDirectionVertical横向滚动
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    layout.minimumLineSpacing = 20;//横向间距
    
    layout.minimumInteritemSpacing = 20;//纵向间距
    //设置每个item的大小 -1保证4个可以放在一行
    layout.itemSize = CGSizeMake((self.view.frame.size.width - 20*3 - 1)/4.0, (self.view.frame.size.width - 20*2)/4.0 + 15);
    
    //创建collectionView 通过一个布局策略layout来创建
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) collectionViewLayout:layout];
    
    self.collectionView.backgroundColor = [UIColor redColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.view addSubview:self.collectionView];
    
    //必须复用 注册cell
    [self.collectionView registerNib:[UINib nibWithNibName:@"TestCell" bundle:nil] forCellWithReuseIdentifier:@"TestCell"];
}

//设置每组有几个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

//使用哪个cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    TestCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TestCell" forIndexPath:indexPath];
    
    cell.contentLabel.text = [NSString stringWithFormat:@"第%ld个",(long)indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"第%ld个",indexPath.row + 1);
    //把indexPath.row带出去
    if (self.didSelected) {
        self.didSelected(indexPath.row);
    }
}

@end
