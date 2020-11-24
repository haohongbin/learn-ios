//
//  ViewController.m
//  oc-创建类
//
//  Created by hhb on 2020/10/26.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建了一个人
    self.person = [[Person alloc]init];
    self.person.name = @"xiaoming";
    self.person.age = 12;
    self.person.sex = 1;
    
    Person *person1 = [[Person alloc]init];
    person1.name = @"xiaofan";
    person1.age = 13;
    person1.sex = 2;
    
    //把数据放到数组
    NSMutableArray *array = [[NSMutableArray alloc]init];
    [array addObject:self.person];
    [array addObject:person1];
    
    //最后会用一个List去展示array里面的数据
    
}


@end
