//
//  ViewController.m
//  oc-类的方法
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
    person.name = @"小明";
    person.age = 12;
    [person functionName];
    NSLog(@"person.age = %ld",(long)person.age);
    
    [person functionNameWithAge:13];
    NSLog(@"person.age = %ld",(long)person.age);
    
    person.age = [person function3];
    
}


@end
