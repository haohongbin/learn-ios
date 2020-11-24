//
//  ViewController.m
//  UIImageView
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
    
    UIImage *image = [UIImage imageNamed:@"test_image"];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    
    imageView.image = image;
    
    imageView.backgroundColor = [UIColor blackColor];
    
    imageView.contentMode = UIViewContentModeScaleToFill;//UIViewContentModeScaleAspectFill，UIViewContentModeScaleToFill
    
    imageView.clipsToBounds = YES;
    
    [self.view addSubview:imageView];
    
    imageView.frame = CGRectMake(0, 0, 100, 100);
}


@end
