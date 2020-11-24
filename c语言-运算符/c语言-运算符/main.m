//
//  main.m
//  c语言-运算符
//
//  Created by hhb on 2020/10/24.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int a = 5;
        int b = 3;
        NSLog(@"除的结果是%d",a/b);
        NSLog(@"取余的结果是%d",a%b);
//        int c = a++;//先把a的值赋值给c，然后a自增1
//        int c = ++a;//先a自增1，然后赋值给c
//        NSLog(@"c = %d",c);
//        NSLog(@"a = %d",a);
        //逻辑运算符
        NSLog(@"结果是%d",!(a||b));
        int c = 0;
//        c-=a;
//        NSLog(@"c = %d",c);
        int d = c>=0?10:20;
        NSLog(@"d = %d",d);
        
        
    }
    return 0;
}
