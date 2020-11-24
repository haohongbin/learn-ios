//
//  ViewController.m
//  oc-类的继承
//
//  Created by hhb on 2020/10/26.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"
#import "Person01.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Person01 *person01 = [[Person01 alloc]init];
    NSLog(@"person01.name = %@",person01.name);
}


@end
