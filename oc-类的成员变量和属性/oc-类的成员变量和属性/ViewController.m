//
//  ViewController.m
//  oc-类的成员变量和属性
//
//  Created by hhb on 2020/10/26.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"
#import "Book.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Book *book = [[Book alloc]init];
    book.name = @"书名";
    book.price = 100;
}


@end
