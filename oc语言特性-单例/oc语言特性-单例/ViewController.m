//
//  ViewController.m
//  oc语言特性-单例
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
    Person *person1 = [[Person alloc]init];
    NSLog(@"person1 = %@",person1);
    Person *person2 = [[Person alloc]init];
    NSLog(@"person2 = %@",person2);
    
    Person *person3 = [Person shareInstance];
    NSLog(@"person3 = %@",person3);
}



@end
