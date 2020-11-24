//
//  ViewController.m
//  UIScrollView
//
//  Created by hhb on 2020/11/9.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
//画布的尺寸大于UIScrollView的尺寸，才可以滚动
@property(nonatomic,strong)UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-100)];
    //contentSize告诉UIScrollView所有内容的尺⼨寸,也就是告诉 它滚动的范围(能滚多远,滚到哪⾥里是尽头)
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 2, self.view.frame.size.height);
    
    self.scrollView.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:self.scrollView];
    
    UIView *view1 = [[UIView alloc]init];
    view1.backgroundColor = [UIColor redColor];
    [self.scrollView addSubview:view1];
    view1.frame = CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height-100);
    
    UIView *view2 = [[UIView alloc]init];
    view2.backgroundColor = [UIColor yellowColor];
    [self.scrollView addSubview:view2];
    view2.frame = CGRectMake(self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height - 100);
    
    self.scrollView.bounces = NO;//设置UIScrollView是否需要弹簧效果
    
    self.scrollView.pagingEnabled = YES;//当值是 YES 会自动滚动到 subview 的边界（默认NO）
    
    self.scrollView.scrollEnabled = YES;//设置UIScrollView是否能滚动
    
    self.scrollView.showsVerticalScrollIndicator = NO;//是否显⽰示垂直滚动条
    
    self.scrollView.showsHorizontalScrollIndicator = YES;//是否显⽰示⽔水平滚动条
    
    self.scrollView.delegate = self;//代理设为当前页面
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"滚动时触发");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"结束滑动");
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSLog(@"结束滚动");
}

//点击屏幕触发，点击空白处触发“结束滚动” setContentOffset改变位移
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.scrollView setContentOffset:CGPointMake(self.view.frame.size.width, 0) animated:YES];
}
@end
