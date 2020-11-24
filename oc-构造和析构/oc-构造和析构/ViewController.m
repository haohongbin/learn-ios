//
//  ViewController.m
//  oc-构造和析构
//
//  Created by hhb on 2020/10/26.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super viewDidLoad];
    //构造 init
    
    //析构 dealloc
    [self test];
}

- (void)test{
    Person *person = [[Person alloc]init];//局部变量，这个方法调用结束，就会被释放
    NSLog(@"person.name = %@",person.name);
}

@end
