//
//  ViewController.m
//  oc语言特性-协议
//
//  Created by hhb on 2020/10/27.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"
#import "Man.h"
#import "Dog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Man *man = [[Man alloc]init];
    [man eat];
    
    Dog *dog = [[Dog alloc]init];
    [dog eat];
    
    //协议是协议  代理是代理
    man.delegate = dog;//dog 成为了man的代理
    
    if ([man.delegate respondsToSelector:@selector(watch)]) {
        [man.delegate watch];
    }
}


@end
