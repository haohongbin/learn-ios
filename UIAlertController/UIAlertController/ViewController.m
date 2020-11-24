//
//  ViewController.m
//  UIAlertController
//
//  Created by hhb on 2020/11/9.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"确认删除吗？" preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        NSLog(@"我点击了确定");
    }];

    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){
        NSLog(@"我选择了取消");
    }];

    [alert addAction:action];
    [alert addAction:cancel];

    [self presentViewController:alert animated:YES completion:^{

    }];
    
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"拍照" message:@"" preferredStyle:UIAlertControllerStyleAlert];
//
//    UIAlertAction *action = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"我点击了从相册选择");
//    }];
//
//    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"我点击了确定");
//    }];
//
//    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"我选择了取消");
//    }];
//
//    [alert addAction:action];
//    [alert addAction:action1];
//    [alert addAction:cancel];
//
//    [self presentViewController:alert animated:YES completion:^{
//
//    }];
}

@end
