//
//  ViewController.m
//  滑动手势
//
//  Created by hhb on 2020/11/13.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    //轻扫
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeClick:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeClick:)];
    
    [self.view addGestureRecognizer:leftSwipe];
    [self.view addGestureRecognizer:rightSwipe];
}

- (void)swipeClick:(UISwipeGestureRecognizer *)sender{
    //用方向来区分
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"左滑动");
    }else{
        NSLog(@"右滑动");
    }
}

@end
