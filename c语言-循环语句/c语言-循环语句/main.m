//
//  main.m
//  c语言-循环语句
//
//  Created by hhb on 2020/10/24.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //while循环
        int a = 10;
//        while (a < 20){
//            NSLog(@"a = %d",a);
//            a++;
//        }
        
        //do-while循环
//        do{
//            a++;
//            NSLog(@"a = %d",a);
//        }while (a<20);
        
        //for循环
//        for (int b = 10; b < 20; b++){
//            NSLog(@"b = %d",b);
//        }
        //break
//        while (a<20) {
//            NSLog(@"a = %d",a);
//            a++;
//            if (a>15) {
//                break;//这里我们就跳出了循环
//            }
//        }
//        NSLog(@"我出来了，不在循环里面了");
        
        
        //Continue
        do{
            if (a == 15) {
                a = a + 1;
                continue;
            }
            NSLog(@"a = %d",a);
            a++;
        }while(a<20);
    }
    return 0;
}
