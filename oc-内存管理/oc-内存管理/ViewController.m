//
//  ViewController.m
//  oc-内存管理
//
//  Created by hhb on 2020/10/27.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //内存
    //手动管理内存
    //
    //面试
    //ARC自动管理
    //MRC手动管理
    //核心是谁创建谁释放，计数器
    //alloc new copy mutalbeCopy  +1
    //retrain +1
    
    //-1  release
    //Object *object = [[Object alloc]init]; +1
    //[object release]; -1
    
    //自己生产的对象，自己持有。
    //非自己生产的对象，自己也能持有。
    //不在需要自己持有对象的时候，释放。
    //非自己持有的对象无需释放。
}


@end
