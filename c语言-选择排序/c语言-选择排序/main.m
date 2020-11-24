//
//  main.m
//  c语言-选择排序
//
//  Created by hhb on 2020/10/26.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int arr[] = {8,7,6,4,5};
        int length = sizeof(arr)/sizeof(int);
        for (int i = 0; i<length-1; i++){
            int minIndex = i;
            for (int j = i+1; j<length; j++){
                if(arr[minIndex] > arr[j]){
                    minIndex = j;
                }
            }
            if(i!=minIndex){
                int temp = arr[i];
                arr[i] = arr[minIndex];
                arr[minIndex] = temp;
            }
        }
        
        for (int i = 0; i<length; i++){
            NSLog(@"arr[%d]=%d",i,arr[i]);
        }
    }
    return 0;
}
