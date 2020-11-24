//
//  main.m
//  c语言-指针
//
//  Created by hhb on 2020/10/24.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        int a = 1;
//        NSLog(@"%u",sizeof(a));//打印a占用了几个字节
//        //1个字节是8个存储单元，a占用了4个字节
//        NSLog(@"%p",&a);//打印a的地址
        
        int a,b;
        int *pinter_1,*pinter_2;
        a = 100;
        b = 10;
        pinter_1 = &a;
        pinter_2 = &b;
        printf("%d,%d\n",a,b);
        printf("%d,%d\n",*pinter_1,*pinter_2);
        //这里的目的就是为了让指针pinter_1 指向 a; 让指针pinter_2去指向b
    }
    return 0;
}
