//
//  ViewController.m
//  oc语言特性-延展
//
//  Created by hhb on 2020/10/27.
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
    Person *person1 = [[Person alloc]init];
    person1.name = @"xiaoming";
    [person1 test1];
}


@end
