//
//  main.m
//  c语言常量与变量
//
//  Created by hhb on 2020/10/23.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>
#define COUNT1 123
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //常量与变量
        const int COUNT = 1;
        //常量是不可以修改的，是只读的
//        count = 2;
        NSLog(@"count = %d",COUNT);
        NSLog(@"count1 = %d",COUNT1);
        int count2 = COUNT * COUNT1;
        NSLog(@"count2 = %d",count2);
    }
    return 0;
}
