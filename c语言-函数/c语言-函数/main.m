//
//  main.m
//  c语言-函数
//
//  Created by hhb on 2020/10/24.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>
int max(int i,int j);
int max(int i,int j){
    if (i>j) {
        return i;
    }else if (i<j){
        return j;
    }else {
        return 0;
    }
};

void readText(void){
    NSLog(@"hi");
};
void readText1(int i){
    NSLog(@"hi%d遍",i);
};
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int a = 1;
        int b = 2;
        //首先定义一个函数  我们需要明确我们需要什么
        //首先我们需要知道 a和b之间哪个大
        //然后我们需要一个函数、方法名字
        //接着我们要对比 a和b
        //最后我们需要实现这个函数
        int c = max(a, b);
        NSLog(@"c=%d",c);
        readText();
        readText1(5);
    }
    return 0;
}
