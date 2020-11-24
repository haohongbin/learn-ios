//
//  main.m
//  c语言-分支语句
//
//  Created by hhb on 2020/10/24.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //分支语句
        int a = 1;
        if (a > 1){
            NSLog(@"a > 1");
        }else{
            NSLog(@"a > 1不成立");
        }
        //switch后面必须是常量，case后面必须是常量
        int b = 10;
        switch (b) {
            case 1:
                NSLog(@"b = 1");
                break;
            case 2:
                NSLog(@"b = 2");
                break;
            default:
                NSLog(@"b = 11");
                break;
        }
    }
    return 0;
}
