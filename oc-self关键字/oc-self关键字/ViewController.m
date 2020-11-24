//
//  ViewController.m
//  oc-self关键字
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
    Person *person = [[Person alloc]init];
    person.name = @"xxx";
    //person是Persion类实例化出来的一个实例
    //function01 是Persion类的实例的方法，而不是类的方法
    [person function01];
    
    //function02 是Person类的方法，不是Person的实例方法
    [Person function02];
    
    //self代表的是当前方法的调用者
    [person function03];
}


@end
