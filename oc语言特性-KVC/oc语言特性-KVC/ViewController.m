//
//  ViewController.m
//  oc语言特性-KVC
//
//  Created by hhb on 2020/10/28.
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
    //kvc的目的是不通过属性，去赋值和取值
    Person *person = [[Person alloc]init];
    
    //利用属性的set赋值
//    person.name = @"xiaoming";
    //get取值
//    NSLog(@"person.name = %@",person.name);
    
    //利用KVC
    //赋值
    [person setValue:@"xiaoming" forKey:@"name"];
    //取值
    NSLog(@"person.name = %@",[person valueForKey:@"name"]);
    
    Address *address = [[Address alloc]init];
    [address setValue:@"shanxi" forKey:@"city"];
    NSLog(@"address.city = %@",[address valueForKeyPath:@"city"]);
    [person setValue:address forKey:@"address"];
    NSLog(@"person.address = %@",[person valueForKeyPath:@"address"]);
    //多级访问（访问person里面的address里面的city）多级访问一定是keypath
    [person setValue:@"shanxi2" forKeyPath:@"address.city"];
    
//    NSLog(@"city = %@",person.address.city);//属性get方法访问
    NSLog(@"city = %@",[person valueForKeyPath:@"address.city"]);
    
    NSLog(@"address.city = %@",[address valueForKeyPath:@"city"]);
}


@end
