//
//  main.m
//  c语言-冒泡排序
//
//  Created by hhb on 2020/10/26.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

void sort(int arr[],int length){
    for (int i = 0; i<length-1; i++){
        for (int j =0; j<length-1-i; j++){
            if (arr[j] > arr[j+1]){
                int temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int arr[] = {8,7,6,4,5};
        int length = sizeof(arr)/sizeof(int);
        sort(arr,length);
        for (int i = 0; i<length; i++){
            NSLog(@"arr=%d",arr[i]);
        }
    }
    return 0;
}
