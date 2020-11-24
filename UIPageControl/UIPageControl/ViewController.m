//
//  ViewController.m
//  UIPageControl
//
//  Created by hhb on 2020/11/4.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //UIPageControl分页
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.numberOfPages = 5;//有5页 5个点
    pageControl.currentPage = 0;
    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];//当前选中点的颜色
    pageControl.pageIndicatorTintColor = [UIColor blackColor];//未选中点的颜色
    
    [self.view addSubview:pageControl];
    
    pageControl.frame = CGRectMake(0, 100, self.view.frame.size.width, 50);
    pageControl.backgroundColor = [UIColor redColor];
}


@end
