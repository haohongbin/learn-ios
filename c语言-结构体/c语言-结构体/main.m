//
//  main.m
//  c语言-结构体
//
//  Created by hhb on 2020/10/24.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //结构体 struct是关键字 Books是这个结构体的类型名称
        //定义一个结构体
        struct Books{
            char title[50];
            char author[50];
            int book_id;
        };
        
        //声明一个结构体变量 book是变量名 它和int/float char等作用是一样的
        struct Books book;
        //赋值 用‘.’点运算 点是所有运算符优先级最高
        book.book_id = 1;
        strcpy(book.title, "小说");
        strcpy(book.author, "小明");
        NSLog(@"book_id=%d,title=%s,author=%s",book.book_id,book.title,book.author);
    }
    return 0;
}
