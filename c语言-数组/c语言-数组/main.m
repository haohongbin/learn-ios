//
//  main.m
//  c语言-数组
//
//  Created by hhb on 2020/10/24.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //数据类型
        //int 整型  0、1、2、3、4、5.。。。
        //float 小数
        //double  小数 精度
        //char 字符 A 、b ,c....
        //数组
        //声明一个数组
        int arr[5];
        int i,j;
        for (i = 0; i<5; i++) {
            arr[i] = i + 100;
        }
        for (j = 0; j<5; j++) {
            NSLog(@"arr[%d]=%d",j,arr[j]);
        }
        
        int arr2[5] = {100,101,102,103,104};
    }
    return 0;
}
