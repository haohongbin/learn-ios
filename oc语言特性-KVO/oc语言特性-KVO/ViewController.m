//
//  ViewController.m
//  oc语言特性-KVO
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
    Person *person = [[Person alloc]init];
    
    //观察到person的属性name发生变化时，调用observeValueForKeyPath方法
    [person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
    [person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    
    person.name = @"xiaogang";
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"进来了");
    id value = change[NSKeyValueChangeNewKey];//拿到新的值
    
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"value = %@",value);
    }else if ([keyPath isEqualToString:@"age"]){
        
    }
}


@end
