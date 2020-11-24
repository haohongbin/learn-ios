//
//  ViewController.m
//  长按手势
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
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"头像01"];
    [self.view addSubview:imageView];
    imageView.bounds = CGRectMake(0, 0, 100, 100);
    imageView.center = self.view.center;
    imageView.userInteractionEnabled = YES;
    
    //长按手势
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressClick:)];
    longPressGesture.minimumPressDuration = 3;//长按时间
    [imageView addGestureRecognizer:longPressGesture];
}

- (void)longPressClick:(UILongPressGestureRecognizer *)sender{
    //判断状态，否则会触发多次
    if (sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"触发");
    }
}

@end
